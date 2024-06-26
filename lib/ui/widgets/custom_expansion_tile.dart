import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:fantasy11_flutter/values/values.dart';
import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 200);

/// A single-line [ListTile] with a trailing button that expands or collapses
/// the tile to reveal or hide the [children].
///
/// This widget is typically used with [ListView] to create an
/// "expand / collapse" list entry. When used with scrolling widgets like
/// [ListView], a unique [PageStorageKey] must be specified to enable the
/// [ExpansionTile] to save and restore its expanded state when it is scrolled
/// in and out of view.
///
/// See also:
///
///  * [ListTile], useful for creating expansion tile [children] when the
///    expansion tile represents a sublist.
///  * The "Expand/collapse" section of
///    <https://material.io/guidelines/components/lists-controls.html>.
class ExpansionTile extends StatefulWidget {
  /// Creates a single-line [ListTile] with a trailing button that expands or collapses
  /// the tile to reveal or hide the [children]. The [initiallyExpanded] property must
  /// be non-null.
  const ExpansionTile({
    Key? key,
    this.headerBackgroundColor,
    this.leading,
    @required this.title,
    this.backgroundColor,
    this.iconColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
  })  : super(key: key);

  /// A widget to display before the title.
  ///
  /// Typically a [CircleAvatar] widget.
  final Widget? leading;

  /// The primary content of the list item.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Called when the tile expands or collapses.
  ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool>? onExpansionChanged;

  /// The widgets that are displayed when the tile expands.
  ///
  /// Typically [ListTile] widgets.
  final List<Widget> children;

  /// The color to display behind the sublist when expanded.
  final Color? backgroundColor;

  /// The color to display the background of the header.
  final Color? headerBackgroundColor;

  /// The color to display the icon of the header.
  final Color? iconColor;

  /// A widget to display instead of a rotating arrow icon.
  final Widget? trailing;

  /// Specifies if the list tile is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  @override
  _ExpansionTileState createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<ExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double>? _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double>? _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final ColorTween? _borderColorTween = ColorTween();
  final ColorTween? _headerColorTween = ColorTween();
  final ColorTween? _iconColorTween = ColorTween();
  final ColorTween? _backgroundColorTween = ColorTween();

  AnimationController? _controller;
  Animation<double>? _heightFactor;
  Animation<Color?>? _borderColor;
  Animation<Color?>? _iconColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller!.drive(_easeInTween!);
    _borderColor = _controller!.drive(_borderColorTween!.chain(_easeOutTween!));
    _iconColor = _controller!.drive(_iconColorTween!.chain(_easeInTween!));

    _isExpanded =
        PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller!.value = 1.0;
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller!.forward();
      } else {
        _controller!.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged != null ? widget.onExpansionChanged!(_isExpanded) : null;
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final Color borderSideColor = _borderColor!.value ?? Colors.transparent;

    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: borderSideColor),
        bottom: BorderSide(color: borderSideColor),
      )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconTheme.merge(
            data: IconThemeData(color: _iconColor!.value),
            child: Container(
              color: widget.headerBackgroundColor,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.title!,
                    _isExpanded
                        ? const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.black,
                          ),
                  ],
                ).wrapPadding(
                    padding: const EdgeInsets.only(
                        left: spacingStandard,
                        right: spacingStandard,
                        top: spacingStandard)),
                onTap: _handleTap,
              ),
            ),
          ),
          ClipRect(
            child: Align(
              heightFactor: _heightFactor!.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _borderColorTween!.end = theme.dividerColor;
    _headerColorTween
      ?..begin = theme.textTheme.subtitle1!.color
      ..end = theme.colorScheme.secondary;
    _iconColorTween
      ?..begin = theme.unselectedWidgetColor
      ..end = theme.colorScheme.secondary;
    _backgroundColorTween!.end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller!.isDismissed;
    return AnimatedBuilder(
      animation: _controller!.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );
  }
}
