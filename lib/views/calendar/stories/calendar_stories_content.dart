part of 'calendar_stories_view.dart';

class _CalendarStoriesContent extends StatelessWidget {
  const _CalendarStoriesContent(this.viewModel);

  final CalendarStoriesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        tooltip: tr("button.new_story"),
        child: const Icon(SpIcons.newStory),
        onPressed: () => viewModel.goToNewPage(context),
      ),
      body: NestedScrollView(
        controller: PrimaryScrollController.maybeOf(context),
        headerSliverBuilder: (context, _) {
          return [
            SliverToBoxAdapter(
              child: SpScrollableChoiceChips<TagDbModel>(
                choices: viewModel.tags ?? [],
                storiesCount: (TagDbModel tag) =>
                    viewModel.tagSelected(tag) ? viewModel.currentFilterStoriesCount : null,
                toLabel: (TagDbModel tag) => tag.title,
                selected: (TagDbModel tag) => viewModel.tagSelected(tag),
                onToggle: (TagDbModel tag) => viewModel.selectTag(tag),
              ),
            ),
            SliverToBoxAdapter(
              child: SpCalendar(
                initialYear: viewModel.year,
                initialMonth: viewModel.month,
                selectedDay: viewModel.selectedDay,
                feelingMapByDay: viewModel.feelingMapByDay,
                onMonthChanged: viewModel.onMonthChanged,
                onDaySelected: viewModel.onDaySelected,
                controller: viewModel.calendarController,
              ),
            ),
          ];
        },
        body: SpStoryList.withQuery(
          disableMultiEdit: true,
          filter: viewModel.searchFilter,
        ),
      ),
    );
  }
}
