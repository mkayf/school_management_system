<script setup>
import { ChevronRight, LayoutDashboard, User, School, LibraryBig } from "lucide-vue-next";
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from '@/components/ui/collapsible';
import {
  SidebarGroup,
  SidebarGroupLabel,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
} from '@/components/ui/sidebar';
import { useRoute } from "vue-router";

defineProps({
  items: { type: Array, required: true },
});

const route = useRoute();

</script>

<template>
  
  <SidebarGroup>
    <SidebarGroupLabel>Home</SidebarGroupLabel>
    <SidebarMenu>
        <SidebarMenuItem>
            <SidebarMenuSub>
              <RouterLink to="/" class="my-1 flex gap-1 items-center"><LayoutDashboard class="h-5" />Dashboard</RouterLink>
            </SidebarMenuSub>
        </SidebarMenuItem>
    </SidebarMenu>
  </SidebarGroup>

  <SidebarGroup>
    <SidebarGroupLabel>Academics</SidebarGroupLabel>
    <SidebarMenu>
        <SidebarMenuItem>
            <SidebarMenuSub>
              <RouterLink to="/students" class="my-1 flex gap-1 items-center"><User class="h-5"/> Students</RouterLink>
              <RouterLink to="/classrooms" class="my-1 flex gap-1 items-center"><School class="h-5" /> Classrooms</RouterLink>
              <RouterLink to="/subjects" class="my-1 flex gap-1 items-center"><LibraryBig class="h-5" /> Subjects</RouterLink>
            </SidebarMenuSub>
        </SidebarMenuItem>
    </SidebarMenu>
  </SidebarGroup>
  
</template>
