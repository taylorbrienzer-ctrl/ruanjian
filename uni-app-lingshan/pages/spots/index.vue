<template>
  <view class="page">
    <view class="topbar">
      <view>
        <text class="title">景点讲解</text>
        <text class="subtitle">历史、文化、演艺和祈福体验</text>
      </view>
      <text class="pill">6 个推荐</text>
    </view>

    <view class="spot-list">
      <view class="card spot" v-for="spot in spots" :key="spot.name">
        <view class="visual"></view>
        <text class="card-title">{{ spot.name }}</text>
        <text class="body">{{ spot.desc }}</text>
        <view class="tag-row">
          <text class="tag" v-for="tag in spot.tags" :key="tag">{{ tag }}</text>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup>
const spots = [
  { name: '灵山大佛', desc: '露天青铜释迦牟尼立像，可讲解手印、登云道和太湖视角。', tags: ['地标', '祈福'] },
  { name: '九龙灌浴', desc: '动态群雕与喷泉表演，适合设置观演提醒和错峰动线。', tags: ['演艺', '必看'] },
  { name: '灵山梵宫', desc: '佛教艺术殿堂，融合传统工艺与现代沉浸式演出。', tags: ['艺术', '室内'] },
  { name: '祥符禅寺', desc: '千年古刹，串联玄奘渊源、古井银杏与撞钟祈福。', tags: ['历史', '禅寺'] }
]
</script>

<style scoped>
.spot-list {
  display: grid;
  gap: 20rpx;
}

.spot {
  display: grid;
  gap: 14rpx;
}

.visual {
  height: 156rpx;
  border-radius: 14rpx;
  background:
    linear-gradient(90deg, rgba(47, 95, 78, .82), rgba(143, 184, 170, .38)),
    radial-gradient(circle at 76% 18%, rgba(231, 198, 128, .7), transparent 28%);
}
</style>
