part of "_.dart";

final app__theme__change__channel = event__channel__broadcast();

late BOOL //
    app__theme__colors__ground__back__contrast__dark___ok /*
`{
  final hour = DateTime.now().hour;
  if (((hour > 18) || (hour < 6)).NOT) {
    app__theme__colors__ground__back__contrast__dark___ok = FALSE;
  }
}` */
    ;

late BOOL //
    app__interface__simple___ok /*
`(screen__width <= screen__ample__width)`
should be avoided ,because of great increase ,in deviation ,from the standard interface
  ,further increasing the complexity ,for similicity seekers ,because the standard guides ,would stop working */
    ;

void app__theme__colors__ground__back__contrast__dark__ok__switch() {
  app__theme__colors__ground__back__contrast__dark___ok = app__theme__colors__ground__back__contrast__dark___ok.NOT;

  /*app__re_build()*/ app__theme__change__channel.event__dispatch();
}
