<template xmlns:v-bind="http://www.w3.org/1999/xhtml"
          xmlns:v-el="http://www.w3.org/1999/xhtml">
    <div class="kpi-container">
        <div class="row">
            <div class="col">
                <div class="icon">
                    <component v-if="icon != null" :is="icon"></component>
                    <img :src="`icons/multicolor/${iconName}`" alt=""/>
                </div>
            </div>
            <div class="col">
                <div class="value number good">
                    <span>{{ value }}</span><span class="unit">{{ unit }}</span>
                </div>
                <div class="metric">{{ metric}}</div>
            </div>
        </div>
        <div class="row">
            <div class="col title">{{ title }}</div>
            <div class="col"></div>
        </div>
    </div>
</template>

<script type="text/babel">
export default {
    props: {
        title: {
            type: String,
        },
        value: {
        },
        unit: {
            type: String,
            default: '%',
        },
        icon: {
            type: Object,
        },
        metric: {
            type: String,
            default: 'lift',
        },
        iconName: {
            type: String,
            default: null,
        },
    },
};
</script>

<style lang="scss" rel="stylesheet/scss" scoped>
.kpi-container {
    background: #fff;
    color: #ff0083;
    border-radius: 1.6rem;
    padding: 2rem 2.4rem 2rem 2.4rem;
    font-size: 1.6rem;
    /*flex-basis: 15%;*/
    /*flex-grow: 1;*/
}

.row {
    display: flex;
    align-items: center;
    justify-content: space-between;

    .col {
        display: flex;
        flex-direction: column;
        align-items: flex-start;

        &:last-of-type {
            align-items: flex-end;
        }
    }
}

.title {
    font-weight: 600;
    color: #111;
    margin-top: 1rem;
    font-size: 2.5rem;
}

.icon {
    width: 9.6rem;
    height: 9.6rem;
    margin-left: -1.2rem;
    margin-top: -1rem;
}

.value {
    font-weight: 700;
    font-size: 4.2rem;
    display: flex;
    align-items: flex-end;

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
}
</style>
