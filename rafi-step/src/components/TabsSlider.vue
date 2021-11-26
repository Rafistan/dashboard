<template xmlns:v-bind="http://www.w3.org/1999/xhtml" xmlns:v-el="http://www.w3.org/1999/xhtml">
    <div class="tabs-slider-container"
         :class="{ disabled: isDisabled }"
         ref="container"
         v-if="tabs != null && tabs.length > 0"
         :style="`width: ${width}; min-height: ${height}`">
        <div class="track">
            <div class="tab-container" v-for="tab in tabs" v-bind:key="tab">
            </div>
        </div>
        <div class="selection-marker" :style="selectionMarkerStyle">
            <div class="handle"></div>
            <div class="handle"></div>
        </div>
        <div class="tabs">
            <div class="tab" v-for="tab in tabs" v-bind:key="tab"
                 :class="{ selected: selectedTabInternal != null && selectedTabInternal.id === tab.id }"
                 @click="selectTab(tab)">
                <div class="icon" v-if="tab.icon != null && actualWidth > 300">
                    <component :is="tab.icon"
                               :style="`width: ${iconWidth}; height: ${iconHeight}`"></component>
                </div>
                <span class="tab-name">{{ tab.name }}</span>
            </div>
        </div>
    </div>
</template>

<script type="text/babel">
export default {
    props: {
        tabs: {
            type: Array,
        },
        selectedTabID: {
            type: String,
        },
        width: {
            type: String,
            default: '24rem',
        },
        height: {
            type: String,
            default: '4rem',
        },
        iconWidth: {
            type: String,
            default: '2rem',
        },
        iconHeight: {
            type: String,
            default: '2rem',
        },
        isDisabled: {
            type: Boolean,
            default: false,
        },
    },
    data() {
        return {
            selectedTabInternal: null,
            actualWidth: 0,
        };
    },
    computed: {
        selectionMarkerStyle() {
            const tabSize = 100 / this.tabs.length;
            const selectedTabIndex = this.selectedTabInternal != null
                ? this.tabs.indexOf(this.tabs.find(x => x.id === this.selectedTabInternal.id))
                : 0;
            return `width: ${tabSize}%; left: ${selectedTabIndex * tabSize}%;`;
        },
    },
    methods: {
        selectTab(tab) {
            if (this.isDisabled) {
                return;
            }
            this.selectedTabInternal = tab;
            this.$emit('selectedTabChanged', tab);
        },
        updateActualWidth() {
            if (this.$refs.container != null) {
                this.actualWidth = parseInt(this.$refs.container.offsetWidth, 10);
            }
        },
    },
    watch: {
        selectedTabID() {
            this.selectedTabInternal = this.selectedTabID == null
                ? this.tabs[0] : this.tabs.find(x => x.id === this.selectedTabID);
        },
    },
    mounted() {
        this.selectedTabInternal = this.selectedTabID == null
            ? this.tabs[0] : this.tabs.find(x => x.id === this.selectedTabID);
        window.addEventListener('resize', () => {
            this.updateActualWidth();
        });
        this.updateActualWidth();
    },
};
</script>

<style lang="scss" rel="stylesheet/scss" scoped>
.tabs-slider-container {
    position: relative;
    overflow: hidden;

    &.disabled {
        .tabs {
            .tab {
                cursor: not-allowed;
            }
        }
    }

    .track {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        border: solid 0.1rem #d2d2d2;
        border-radius: 0.5rem;
        background-color: #f7f7f7;
        box-shadow: inset 0 0.2rem 0.2rem rgba(0, 0, 0, 0.1);;
        display: flex;
        align-items: center;

        .tab-container {
            flex-basis: 100%;
            height: 90%;
        }
    }

    .selection-marker {
        background-color: #ff0083;
        position: absolute;
        transition: all 0.5s cubic-bezier(.2, 1, .2, 1);
        height: 100%;
        border: solid 0.1rem #d2d2d2;
        border-radius: 0.5rem;
        box-shadow: 0 0.2rem 0.8rem rgba(0, 0, 0, 0.25);

        .handle {
            position: absolute;
            width: 0.4rem;
            height: 60%;
            top: 20%;
            box-shadow: 0 0 0.8rem rgba(0, 0, 0, 0.1);

            border-left: solid 0.1rem transparentize(#fff, 0.5);
            border-right: solid 0.1rem transparentize(#fff, 0.5);

            &:first-of-type {
                left: 0.5rem;
            }

            &:last-of-type {
                right: 0.5rem;
            }
        }
    }

    .tabs {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        display: flex;
        align-items: center;

        .tab {
            cursor: pointer;
            transition: all 0.5s cubic-bezier(.2, 1, .2, 1);
            display: flex;
            flex-basis: 100%;
            align-items: center;
            justify-content: center;
            padding: 1.2rem 1.6rem;
            font-weight: 600;
            color: lighten(#464646, 50);

            .icon {
                display: flex;
                align-items: center;
                margin-right: 0.6rem;

                svg {
                    fill: lighten(#464646, 50);
                    stroke: lighten(#464646, 50);
                }
            }

            &.selected {
                transition: all 0.5s cubic-bezier(.2, 1, .2, 1);
                color: #fff;

                .icon {
                    svg {
                        fill: #fff;
                        stroke: #fff;
                    }
                }
            }
        }
    }
}

</style>
