<template>
    <div class="main-container">
        <div class="kpis">
            <kpi v-for="category in answers.filter(x => x.showInTopKPIs)"
                 v-bind:key="category.title"
                 :title="category.title"
                 :value="category.value"
                 :metric="category.metric"
                 :unit="category.unit"
                 :icon-name="category.iconName"></kpi>
        </div>
        <div class="main-content">
            <div class="carousel">
                <carousel-3d width="260"
                             height="560"
                             animation-speed="200"
                             v-on:after-slide-change="afterSlideChange">
                    <slide v-for="(category, i) in answers" :index="i" v-bind:key="category.id">
                        <div class="gradient-background">
                            <div class="iphone-container">
                                <!--                <div class="time">{{ moment().format('h:mmA') }}</div>-->
                                <div class="vertical-content">
                                    <img :src="`icons/multicolor/${category.iconName}`" alt="">
                                    <div class="title">
                                        {{ category.title }}
                                    </div>
                                    <div class="description">
                                        {{ category.question }}
                                    </div>
                                    <div class="badge-container">
                    <span v-if="category.hasFreeTextAnswers" class="badge badge-success">
                      free text</span>
                                        <span v-else class="badge badge-info">multiple choices</span>
                                    </div>
                                    <div class="page-count">{{ i + 1 }}/{{ answers.length }}</div>
                                    <div class="progress">
                                        <div class="dot" v-for="cat2 in answers" v-bind:key="cat2.name"
                                             :class="{ selected: cat2 === category }">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </slide>
                </carousel-3d>
                <div class="carousel-title">Questionnaire</div>
            </div>
            <div class="category-details animated"
                 :class="{ rotateInDownRight: animateCategoryDetailsIn,
           rotateOutDownRight: !animateCategoryDetailsIn }"
                 v-if="activeCategory != null">
                <div class="header">
                    <div class="icon">
                        <img :src="`icons/multicolor/${activeCategory.iconName}`" alt="">
                    </div>
                    <div class="text">
                        <div class="title">{{ activeCategory.title }}</div>
                        <div class="muted">{{ activeCategory.question }}</div>
                    </div>
                    <div class="lift" v-if="activeCategory.value">
                        <div class="value number">
              <span class="number good">{{
                      numeral(activeCategory.value)
                          .format("0.[0]")
                  }}</span><span
                            class="unit">%</span>
                        </div>
                        <div class="metric">{{ activeCategory.metric }}</div>
                    </div>
                </div>
                <div class="answers">
                    <div class="tabs-container">
                        <tabs-slider v-if="activeCategory.exposed != null"
                                     @selectedTabChanged="(tab) => activeCategoryDetailsTab = tab.id"
                                     :tabs="[{ id: 'control', name: activeCategory.controlLabel || 'Control' },
                         { id: 'exposed', name: 'Exposed' }]">
                        </tabs-slider>
                    </div>
                    <answers-list
                        v-if="activeCategory.exposed == null || activeCategoryDetailsTab === 'control'"
                        :activeCategory="activeCategory"
                        :answers="activeCategory.control"></answers-list>
                    <answers-list
                        v-if="activeCategory.exposed != null && activeCategoryDetailsTab === 'exposed'"
                        :activeCategory="activeCategory"
                        :answers="activeCategory.exposed"></answers-list>
                </div>
            </div>
        </div>
    </div>
</template>

<script type="text/babel">
import { Carousel3d, Slide } from 'vue-carousel-3d';
import moment from 'moment';
import numeral from 'numeral';
// import GoogleImages from 'google-images';

import Kpi from './Kpi.vue';
import TabsSlider from './TabsSlider.vue';

import answers from '../assets/data/answers/Answers.json';
import AnswersList from './AnswersList.txt';

export default {
    name: 'Dashboard',
    props: {
        msg: String,
    },
    components: {
        AnswersList,
        Carousel3d,
        Kpi,
        Slide,
        TabsSlider,
    },
    data() {
        return {
            activeCategory: null,
            activeCategoryDetailsTab: 'control',
            animateCategoryDetailsIn: true,
            answers,
            logoRepo: {},
            moment,
            numeral,
        };
    },
    methods: {
        afterSlideChange(index) {
            this.animateCategoryDetailsIn = false;
            setTimeout(() => {
                this.animateCategoryDetailsIn = true;
                this.activeCategory = answers[index];
            }, 500);
        },
    },
    mounted() {
        [this.activeCategory] = answers;
    },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.main-container {
    display: flex;
    flex-direction: column;
    overflow-x: auto; // add horizontal bar option in html
    overflow-y: auto; // add vertical bar option in html
}

header {
    padding: 2.4rem 3.2rem;
    font-size: 2.4rem;
    font-weight: 700;
    display: flex;
    justify-content: space-between;
    align-items: center;

    .title {
        display: flex;
        align-items: center;
        width: 100%;

        img {
            margin-right: 1.6rem;
            flex-shrink: 0;
        }

        span {
            flex-shrink: 0;
            flex-grow: 1;
            white-space: nowrap;
        }

        .spacer {
            flex-grow: 1;
            flex-basis: 100%;
        }
    }

    img {
        height: 3.2rem;
    }
}

a {
    color: #ff0083;
}

.muted {
    color: #aaa;
    font-weight: 600;
}

.kpis {
    padding: 1vw 2vw 0;
    display: flex;
    justify-content: space-between;
    flex-shrink: 0;

    .kpi-container {
        flex-grow: 1;
        margin: 0 1.6rem;
        width: 20%;

        &:first-of-type {
            margin-left: 3.2rem;
        }

        &:last-of-type {
            margin-right: 3.2rem;
        }
    }
}

.main-content {
    flex-grow: 1;
    display: flex;
    flex-direction: row;
    max-height: calc(100vh - 27rem);

    .carousel {
        position: relative;
        flex-shrink: 0;
        width: 70rem;
        height: 60rem;
        display: flex;
        align-items: center;

        .carousel-title {
            position: absolute;
            /*top: 0;*/
            /*left: 0;*/
            z-index: 10;
            /*margin-left: 50%;*/
            margin-left: 3.2rem;
            margin-top: 2.6rem;
            top: 0;
            padding: 1rem 1.6rem;
            background: #fff;
            border-radius: 1.6rem;
            /*box-shadow: 0 0.3rem 0.6rem #00000055 ;*/
            font-weight: 600;
            font-size: 2rem;
        }
    }

    .carousel-3d-slide {
        border-width: 0 !important;
        background: transparent;
        display: flex;
        align-items: center;
        justify-content: center;

        &.current {
            filter: none;
        }

        &.left-1 {
            filter: blur(1px);
        }

        &.left-2 {
            filter: blur(2px);
        }

        &.right-1 {
            filter: blur(1px);
        }

        &.right-2 {
            filter: blur(2px);
        }

        .slide-container {
            margin: 0.5rem;
            display: flex;
            border-radius: 4rem;
            align-items: center;
            justify-content: center;
            background: #fff;
            box-shadow: 0 0.1rem 0.6rem rgba(0, 0, 0, 0.95);
        }

        .gradient-background {
            background: #FFFFFF;
            background: -webkit-linear-gradient(top, #FFFFFF, #f9f9f9);
            background: -moz-linear-gradient(top, #FFFFFF, #f9f9f9);
            background: linear-gradient(to bottom, #FFFFFF, #f9f9f9);
            justify-content: center;
            width: 24rem;
            height: 49rem;
            border-radius: 4rem;
            // background: #fff;
            /*box-shadow: 0 0.1rem 0.6rem rgba(0,0,0,0.25);*/
            /*margin: 1rem;*/
        }

        .iphone-container {
            margin-top: -0.5rem;
            margin-left: -0.5rem;
            width: 25rem;
            height: 50rem;
            background: url('../assets/iphoneX.png');
            /*background-color: #fff;*/
            border-radius: 3.8rem;
            background-size: cover;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            box-shadow: 0 0.1rem 0.3rem rgba(0, 0, 0, 0.25);

            .time {
                position: absolute;
                top: 5.5rem;
                left: 5.6rem;
                font-size: 0.6rem;
                font-weight: 700;
            }

            .vertical-content {
                display: flex;
                margin-top: 4.8rem;
                flex-direction: column;
                align-items: center;
                flex-grow: 1;
                height: 40rem;

                img {
                    width: 16rem;
                    height: 16rem;
                }

                .title {
                    flex-shrink: 0;
                    font-size: 1.8rem;
                    font-weight: 700;
                    width: 65%;
                }

                .description {
                    color: #666;
                    margin-top: 0.8rem;
                    width: 65%;
                    flex-grow: 1;
                }

                .badge-container {
                    margin-bottom: 2rem;
                }

                .badge {
                    flex-shrink: 0;

                    &.badge-info {
                        background: #0F78FF;
                    }

                    &.badge-success {
                        background: #00d479;
                    }

                    color: #fff;
                    padding: 0.5rem 1rem;
                    font-weight: 700;
                    border-radius: 1rem;
                    font-size: 1.2rem;
                }

                .page-count {
                    flex-shrink: 0;
                    text-align: right;
                    font-size: 1.2rem;
                    margin-bottom: 0.4rem;
                    font-weight: 300;
                }

                .progress {
                    display: flex;
                    justify-content: space-around;

                    .dot {
                        margin: 0.2rem;
                        width: 0.6rem;
                        height: 0.6rem;
                        border-radius: 0.6rem;
                        background-color: #ccc;

                        &.selected {
                            background: #ff0083;
                        }
                    }
                }
            }
        }
    }

    .category-details {
        flex-grow: 1;
        background: #fff;
        border-radius: 1.6rem;
        padding: 1.6rem 3.2rem;
        margin: 3.2rem;
        display: flex;
        flex-direction: column;
        animation-duration: 0.3s;
        height: 50rem;

        .header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;

            .icon {
                min-width: 13rem;
                min-height: 13rem;
                margin-right: 1rem;
            }

            .text {
                flex-grow: 1;
                display: flex;
                flex-direction: column;

                .title {
                    font-weight: 700;
                    font-size: 2.8rem;
                    margin-bottom: 0.6rem;
                }
            }

            .lift {
                margin-left: 1.6rem;

                .value {
                    font-weight: 700;
                    font-size: 6.4rem;
                    display: flex;
                    align-items: flex-end;
                    color: #ff0083;

                    .unit {
                        margin-left: 0.3rem;
                        margin-bottom: 0.4rem;
                        color: #aaa;
                        font-size: 2.6rem;
                    }
                }

                .metric {
                    color: #aaa;
                    font-weight: 600;
                    font-size: 2.4rem;
                    text-align: right;
                }
            }
        }

        .answers {
            font-size: 1.6rem;
            display: flex;
            flex-direction: column;
            max-height: calc(100% - 19rem);

            .tabs-container {
                display: flex;
                flex-shrink: 0;
                flex-direction: column;
                align-items: center;
                margin-bottom: -1rem;

                .tabs-slider-container {
                    margin-bottom: 1.6rem;
                }
            }
        }
    }
}
</style>
