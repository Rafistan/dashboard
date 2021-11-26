<template xmlns:v-bind="http://www.w3.org/1999/xhtml"
          xmlns:v-el="http://www.w3.org/1999/xhtml">
    <div class="table-container">
        <div v-if="activeCategory.useBrands"
             :class="{ 'top-3' : visibleAnswers.length >= 3, 'top-2': visibleAnswers.length <= 2 }">
            <div class="top-brand" v-for="a in visibleAnswers.slice(0,10)"
                 v-bind:key="a.answer">
                <div class="logos">
                    <div class="logo"
                         v-for="logo in a.logos"
                         v-bind:key="logo"
                         :title="a.answer"
                         :style="`background-image: url(${logo});`"></div>
                </div>
                <div class="numbers">
          <span class="number" :class="{ good: activeCategory.expectedAnswer === a.answer }">
            {{
                  numeral(a.value)
                      .format('0')
              }}%</span>
                </div>
            </div>
        </div>
        <template v-if="!activeCategory.useBrands">
            <div>
                <table>
                    <colgroup>
                        <col>
                        <col width="50">
                        <col width="50">
                        <col width="10">
                    </colgroup>
                    <thead class="table-head">
                    <tr>
                        <th>Answer</th>
                        <th>%</th>
                    </tr>
                    </thead>
                    <tbody class="table-body">
                    <tr
                        v-for="a in visibleAnswers.slice(activeCategory.useBrands ? 5 : 0)"
                        v-bind:key="a.answer">
                        <td>
                            <template v-if="a.logos != null">
                                <div class="logos">
                                    <div class="logo"
                                         v-for="logo in a.logos"
                                         v-bind:key="logo"
                                         :title="a.answer"
                                         :style="`background-image: url(${logo});`"></div>
                                </div>
                            </template>
                            <template v-else>
                                {{ a.answer }}
                            </template>
                        </td>
                        <td class="number">{{
                                numeral(a.value / 100)
                                    .format(activeCategory.numberFormat || '0.0%')
                            }}
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </template>
    </div>
</template>

<script type="text/babel">
import numeral from 'numeral';

export default {
    name: '',
    props: {
        activeCategory: {
            type: Object,
        },
        answers: {
            type: Array,
        },
    },
    data() {
        return {
            numeral,
        };
    },
    computed: {
        totalLogos() {
            return this.visibleAnswers.reduce((mem, x) => mem + x.logos.length, 0);
        },
        visibleAnswers() {
            return this.answers.filter(x => !x.hidden);
        },
    },
};
</script>

<style lang="scss" rel="stylesheet/scss" scoped>

.top-2,
.top-3,
.top-4,
.top-5 {
    display: flex;
    flex-shrink: 0;
    align-items: center;
    justify-content: space-between;
    /*margin: 1rem;*/
    /*border-top: solid 0.1rem #eee;*/
    /*border-bottom: solid 0.1rem #eee;*/
    padding: 0rem 1rem;
    margin-bottom: 1rem;
    flex-wrap: wrap;

    .top-brand {
        flex-basis: 18%;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 1rem 0;
        justify-content: center;

        .logos {
            width: 100%;
        }

        .logo {
            //width: 90%;
            height: 6.4rem;
            margin-bottom: 1rem;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
        }

        .brand {
            text-align: center;
            //text-transform: capitalize;
        }

        .numbers {
            text-align: center;

            .number {
                font-size: 3.2rem;
            }
        }
    }
}

.top-3 {
    .top-brand {
        flex-basis: 33%;
    }
}

.top-4 {
    .top-brand {
        flex-basis: 25%;
    }
}

.top-5 {
    .top-brand {
        flex-basis: 18%;
    }
}

.top-2 {
    .top-brand {
        .logos {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            min-height: 15rem;
        }

        .logo {
            width: 7.5rem;
        }
    }
}

.table-container {
    max-height: calc(100% - 1rem);
    display: flex;
    flex-direction: column;
}

table {
    width: 100%;
}

.table-head {
    border-bottom: solid 0.1rem #eee;
    padding-bottom: 1rem;
    margin-bottom: 1rem;

    th {
        text-align: left;
        padding: 0.3rem 0.8rem;

        &:first-of-type {
            text-align: left;
        }
    }
}

.table-body {
    overflow-y: auto;
    td {
        text-align: right;
        padding: 0.6rem 0.8rem;

        &:first-of-type {
            text-align: left;
            //text-transform: capitalize;
        }

        &:last-of-type {
            color: #ff0083;
        }

        .logos {
            display: flex;
            flex-wrap: wrap;
        }

        .logo {
            height: 4.8rem;
            width: 4.8rem;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center center;
            margin-right: 1rem;
            margin-bottom: 1rem;

            &:last-of-type {
                margin-right: 0;
                margin-bottom: 0;
            }
        }

        &.number {
            text-align: right;
        }
    }
}

</style>
