<template>
  <view class="page">
    <view class="topbar">
      <view>
        <text class="title">路线推荐</text>
        <text class="subtitle">按兴趣、时间和人流生成路线</text>
      </view>
      <text class="pill">120 分钟</text>
    </view>

    <scroll-view class="chips" scroll-x>
      <text v-for="tag in tags" :key="tag" class="chip" :class="{ active: tag === active }" @tap="active = tag">{{ tag }}</text>
    </scroll-view>

    <view class="section route-list">
      <view class="card route-card" v-for="route in routes" :key="route.name">
        <view class="route-head">
          <text class="card-title">{{ route.name }}</text>
          <text class="time">{{ route.time }}</text>
        </view>
        <text class="body">{{ route.reason }}</text>
        <view class="path">
          <text v-for="spot in route.spots" :key="spot">{{ spot }}</text>
        </view>
        <view class="tag-row">
          <text class="tag" v-for="tag in route.tags" :key="tag">{{ tag }}</text>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup>
import { ref } from 'vue'

const tags = ['历史文化', '自然风光', '亲子慢游', '祈福朝圣', '摄影打卡']
const active = ref('历史文化')
const routes = [
  {
    name: '梵音礼佛文化线',
    time: '120 分钟',
    reason: '适合第一次到灵山的游客，串联入口文化、动态景观和核心地标。',
    spots: ['大照壁', '五明桥', '九龙灌浴', '灵山大佛'],
    tags: ['文化讲解', '演出提醒']
  },
  {
    name: '太湖山色轻游线',
    time: '90 分钟',
    reason: '步行压力较低，适合慢游、拍照和避开高峰拥挤点位。',
    spots: ['佛足坛', '菩提大道', '曼飞龙塔', '灵山精舍'],
    tags: ['低体力', '自然风光']
  }
]
</script>

<style scoped>
.chips {
  white-space: nowrap;
  margin: 0 -28rpx;
  padding: 0 28rpx;
}

.chip {
  display: inline-flex;
  margin-right: 12rpx;
  padding: 14rpx 20rpx;
  border-radius: 16rpx;
  color: #2f5f4e;
  background: rgba(255, 250, 240, .8);
  font-size: 24rpx;
  font-weight: 700;
}

.chip.active {
  color: #fffaf0;
  background: #2f5f4e;
}

.route-list {
  display: grid;
  gap: 20rpx;
}

.route-head {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 18rpx;
}

.time {
  color: #a74d39;
  font-size: 24rpx;
  font-weight: 800;
}

.path {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 12rpx;
  margin-top: 20rpx;
}

.path text {
  padding: 14rpx;
  border-radius: 14rpx;
  background: rgba(47, 95, 78, .08);
  color: #213d34;
  font-size: 24rpx;
  text-align: center;
  font-weight: 700;
}
</style>
