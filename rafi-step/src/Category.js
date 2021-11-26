export default class Category {
  constructor({
                name,
                description,
                icon,
                answersControl = null,
                answersExposed = null,
                expectedAnswers = null,
                lift = null,
                useBrands = false,
                hasFreeTextAnswers = false,
              }) {
    this.name = name;
    this.description = description;
    this.icon = icon;
    this.answersControl = answersControl;
    this.answersExposed = answersExposed;
    this.precomputedLift = lift;
    this.expectedAnswers = expectedAnswers;
    this.useBrands = useBrands;
    this.hasFreeTextAnswers = hasFreeTextAnswers;

    this.lift = lift == null
      ? this.getComputedLift()
      : lift;
  }

  isExpectedAnswer(a) {
    return this.expectedAnswers.some(ea => a.toLowerCase()
      .includes(ea.toLowerCase()));
  }

  getComputedLift() {
    if (this.precomputedLift != null) {
      debugger; // eslint-disable-line
      return this.precomputedLift;
    }
    if (this.answersControl == null || this.answersExposed == null) {
      debugger; // eslint-disable-line
      return null;
    }
    // console.log(this.name);
    // console.log(this.answersControl.map(x => x.answer));
    // console.log(this.answersExposed.map(x => x.answer));

    let lift = null;
    if (this.expectedAnswers === true) {
      const lifts = this.answersControl.map((x) => {
        const exposed = this.answersExposed.find(e => e.answer === x.answer);
        return {
          exposed: exposed.count,
          control: x.count,
          totalCount: exposed.count + x.count,
          lift: (exposed.count - x.count) / x.count * 100,
        };
      });
      const totalCount = lifts.reduce((mem, l) => mem + l.totalCount, 0);
      lift = lifts.reduce((mem, l) => mem + ((l.totalCount / totalCount) * l.lift), 0);
    } else {
      const matchingExposed = this.answersExposed
        .filter(x => this.expectedAnswers.some(ea => x.answer.toLowerCase()
          .includes(ea.toLowerCase())));
      const exposed = matchingExposed
        .map(x => x.count)
        .reduce((mem, x) => mem + x, 0);
      const matchingControl = this.answersControl
        .filter(x => this.expectedAnswers.some(ea => x.answer.toLowerCase()
          .includes(ea.toLowerCase())));
      const control = matchingControl
        .map(x => x.count)
        .reduce((mem, x) => mem + x, 0);
      const totalExposed = this.answersExposed.reduce((count, x) => x.count + count, 0);
      const totalControl = this.answersControl.reduce((count, x) => x.count + count, 0);
      lift = ((exposed / totalExposed)
        / (control / totalControl) - 1) * 100;
    }
    return lift;
  }
}
