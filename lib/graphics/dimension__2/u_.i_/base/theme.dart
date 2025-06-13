part of "_.dart";

final base__app__theme__change__channel = base__event__channel__broadcast();

late BOOL //
    base__app__theme__colors__ground__back__contrast__dark__ok /*
`{
  final hour = DateTime.now().hour;
  if (((hour > 18) || (hour < 6)).not) {
    base__app__theme__colors__ground__back__contrast__dark__ok = NO;
  }
}` */
    ;

late BOOL //
    base__app__interface__simple__ok /*
`(base__screen__width <= base__screen__ample__width)`
should be avoided ,because of great increase ,in deviation ,from the standard interface 
  ,further increasing the complexity ,for similicity seekers ,because the standard guides ,would stop working */
    ;

void base__app__theme__colors__ground__back__contrast__dark__ok__switch() {
  base__app__theme__colors__ground__back__contrast__dark__ok = base__app__theme__colors__ground__back__contrast__dark__ok.not;

  /*base__app__build__re()*/ base__app__theme__change__channel.event__dispatch();
}
