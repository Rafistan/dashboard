export default class Answer {
  constructor({
    answer,
    count,
    ratio,
    logos = null,
    hidden,
  }) {
    this.answer = answer;
    this.count = count;
    this.ratio = ratio;
    this.logos = logos;
    this.hidden = hidden;
  }
}
