import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'task_model.dart';
export 'task_model.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.tasksDocument,
    required this.checkAction,
    required this.uncheckAction,
    bool? disabled,
  }) : disabled = disabled ?? false;

  final TasksRecord? tasksDocument;
  final Future Function()? checkAction;
  final Future Function()? uncheckAction;
  final bool disabled;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late TaskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).black,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Theme(
                data: ThemeData(
                  checkboxTheme: const CheckboxThemeData(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: CircleBorder(),
                  ),
                  unselectedWidgetColor:
                      FlutterFlowTheme.of(context).primaryText,
                ),
                child: Checkbox(
                  value: _model.checkboxValue ??=
                      widget.tasksDocument!.completed,
                  onChanged: widget.disabled
                      ? null
                      : (newValue) async {
                          safeSetState(() => _model.checkboxValue = newValue!);
                          if (newValue!) {
                            await widget.checkAction?.call();
                          } else {
                            await widget.uncheckAction?.call();
                          }
                        },
                  side: BorderSide(
                    width: 2,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  activeColor: FlutterFlowTheme.of(context).primary,
                  checkColor: widget.disabled
                      ? null
                      : FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              Flexible(
                child: Text(
                  valueOrDefault<String>(
                    widget.tasksDocument?.title,
                    'title',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
