<template>
    <div id="app">
        <header>
            <div class="title">
                <img src="https://cloudfront-ax-staging.s3.amazonaws.com/org_ef1df7d7-ce61-4569-af9b-651c015f2a69.png" alt="">
            </div>
            <div class="powered-by">
                <div class="spacer">&nbsp;</div>
                <img src="https://cloudfront-ax-staging.s3.amazonaws.com/org_ee6bcc3c-b422-42b7-aa7a-407177f0f691.png" alt="">
            </div>
        </header>
        <Dashboard/>
    </div>
</template>

<script type="text/babel">
import Dashboard from './components/Dashboard';
import './animate.css';

export default {
    name: 'app',
    components: {
        Dashboard,
    },
};
</script>

<style lang="scss">
html {
    background: #F3F2F8;
    font-size: 62.5%;
    margin: 0;
    padding: 0;
    overflow-y: hidden;
}

header {
    padding: 0.8vw 1.6vw;
    //font-weight: 700;
    justify-content: space-between;
    font-size: 2vw;
    font-family: BullTextRegular;
    display: flex;
    align-items: center;
    //text-transform: uppercase;
    flex-grow: 0;

    .title {
        font-family: BullBold;
        display: flex;
        align-items: center;
        color: #555;

        svg, img {
            margin-right: 1.6rem;
            height: 2.4vw;
            fill: #db0840;
        }

        img {
            max-height: 2.4vw;
            position: relative;
        }

        span {
            flex-grow: 1;
            white-space: nowrap;
        }
    }

    img {
        height: 3.2rem;
    }

    .powered-by {
        display: flex;
        align-items: center;
        font-weight: 400;
        color: #555;
        position: relative;

        span {
            font-size: 1.1vw;
            margin-right: 1vw;
        }

        img {
            height: 3.8vw;
        }
    }
}

body {
    font-size: 1.4rem;
    padding: 0;
    margin: 0;
}

@font-face {
    font-family: "SFProDisplay";
    src: url('./assets/fonts/SF-Pro-Display-Black.otf');
    font-weight: 900;
}

@font-face {
    font-family: "SFProDisplay";
    src: url('./assets/fonts/SF-Pro-Display-Heavy.otf');
    font-weight: 800;
}

@font-face {
    font-family: "SFProDisplay";
    src: url('./assets/fonts/SF-Pro-Display-Bold.otf');
    font-weight: 700;
}

@font-face {
    font-family: "SFProDisplay";
    src: url('./assets/fonts/SF-Pro-Display-Semibold.otf');
    font-weight: 600;
}

@font-face {
    font-family: "SFProDisplay";
    src: url('./assets/fonts/SF-Pro-Display-Medium.otf');
    font-weight: 500;
}

@font-face {
    font-family: "SFProDisplay";
    src: url('./assets/fonts/SF-Pro-Display-Regular.otf');
    font-weight: 400;
}

@font-face {
    font-family: "SFProDisplay";
    src: url('./assets/fonts/SF-Pro-Display-Thin.otf');
    font-weight: 300;
}

@font-face {
    font-family: "SFProDisplay";
    src: url('./assets/fonts/SF-Pro-Display-Light.otf');
    font-weight: 200;
}

@font-face {
    font-family: "SFProDisplay";
    src: url('./assets/fonts/SF-Pro-Display-Ultralight.otf');
    font-weight: 100;
}

@font-face {
    font-family: "SFProRounded";
    src: url('./assets/fonts/SF-Pro-Rounded-Bold.otf');
    font-weight: 700;
}

#app {
    font-family: "SFProDisplay", "SF Pro Icons", -apple-system, BlinkMacSystemFont, "Segoe UI",
    Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji",
    "Segoe UI Symbol";
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #000000cc;
    padding: 0;
    margin: 0;
    overflow: hidden;
}

.number {
    font-family: "SFProRounded";
    font-weight: 700;
    color: #ff0083;
}

.good {
    color: #00d479;
}

</style>
