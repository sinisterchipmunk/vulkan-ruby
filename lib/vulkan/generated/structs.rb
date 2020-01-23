# vulkan-ruby 0.1.0
#
#   => https://github.com/sinisterchipmunk/vulkan-ruby
#
# [NOTICE] This is an automatically generated file.

module Vulkan
  VkGeometryTrianglesNV = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkBuffer  vertexData",
                                  "VkDeviceSize  vertexOffset",
                                  "uint32_t  vertexCount",
                                  "VkDeviceSize  vertexStride",
                                  "VkFormat  vertexFormat",
                                  "VkBuffer  indexData",
                                  "VkDeviceSize  indexOffset",
                                  "uint32_t  indexCount",
                                  "VkIndexType  indexType",
                                  "VkBuffer  transformData",
                                  "VkDeviceSize  transformOffset"]
  VkGeometryAABBNV = struct ["VkStructureType  sType",
                             "void * pNext",
                             "VkBuffer  aabbData",
                             "uint32_t  numAABBs",
                             "uint32_t  stride",
                             "VkDeviceSize  offset"]
  VkGeometryDataNV = struct [{ "triangles" => VkGeometryTrianglesNV },
                             { "aabbs" => VkGeometryAABBNV }]
  VkGeometryNV = struct ["VkStructureType  sType",
                         "void * pNext",
                         "VkGeometryTypeNV  geometryType",
                         { "geometry" => VkGeometryDataNV },
                         "VkGeometryFlagsNV  flags"]
  VkAccelerationStructureInfoNV = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkAccelerationStructureTypeNV  type",
                                          "VkBuildAccelerationStructureFlagsNV  flags",
                                          "uint32_t  instanceCount",
                                          "uint32_t  geometryCount",
                                          "VkGeometryNV * pGeometries"]
  VkAccelerationStructureCreateInfoNV = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkDeviceSize  compactedSize",
                                                { "info" => VkAccelerationStructureInfoNV }]

  VkAccelerationStructureMemoryRequirementsInfoNV = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkAccelerationStructureMemoryRequirementsTypeNV  type",
                                                            "VkAccelerationStructureNV  accelerationStructure"]

  VkAcquireNextImageInfoKHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkSwapchainKHR  swapchain",
                                      "uint64_t  timeout",
                                      "VkSemaphore  semaphore",
                                      "VkFence  fence",
                                      "uint32_t  deviceMask"]

  VkAllocationCallbacks = struct ["void * pUserData",
                                  "PFN_vkAllocationFunction  pfnAllocation",
                                  "PFN_vkReallocationFunction  pfnReallocation",
                                  "PFN_vkFreeFunction  pfnFree",
                                  "PFN_vkInternalAllocationNotification  pfnInternalAllocation",
                                  "PFN_vkInternalFreeNotification  pfnInternalFree"]

  VkComponentMapping = struct ["VkComponentSwizzle  r",
                               "VkComponentSwizzle  g",
                               "VkComponentSwizzle  b",
                               "VkComponentSwizzle  a"]
  VkAndroidHardwareBufferFormatPropertiesANDROID = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkFormat  format",
                                                           "uint64_t  externalFormat",
                                                           "VkFormatFeatureFlags  formatFeatures",
                                                           { "samplerYcbcrConversionComponents" => VkComponentMapping },
                                                           "VkSamplerYcbcrModelConversion  suggestedYcbcrModel",
                                                           "VkSamplerYcbcrRange  suggestedYcbcrRange",
                                                           "VkChromaLocation  suggestedXChromaOffset",
                                                           "VkChromaLocation  suggestedYChromaOffset"]

  VkAndroidHardwareBufferPropertiesANDROID = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkDeviceSize  allocationSize",
                                                     "uint32_t  memoryTypeBits"]

  VkAndroidHardwareBufferUsageANDROID = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint64_t  androidHardwareBufferUsage"]

  VkAndroidSurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkAndroidSurfaceCreateFlagsKHR  flags",
                                          "ANativeWindow * window"]

  VkApplicationInfo = struct ["VkStructureType  sType",
                              "void * pNext",
                              "char * pApplicationName",
                              "uint32_t  applicationVersion",
                              "char * pEngineName",
                              "uint32_t  engineVersion",
                              "uint32_t  apiVersion"]

  VkAttachmentDescription = struct ["VkAttachmentDescriptionFlags  flags",
                                    "VkFormat  format",
                                    "VkSampleCountFlagBits  samples",
                                    "VkAttachmentLoadOp  loadOp",
                                    "VkAttachmentStoreOp  storeOp",
                                    "VkAttachmentLoadOp  stencilLoadOp",
                                    "VkAttachmentStoreOp  stencilStoreOp",
                                    "VkImageLayout  initialLayout",
                                    "VkImageLayout  finalLayout"]

  VkAttachmentDescription2KHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkAttachmentDescriptionFlags  flags",
                                        "VkFormat  format",
                                        "VkSampleCountFlagBits  samples",
                                        "VkAttachmentLoadOp  loadOp",
                                        "VkAttachmentStoreOp  storeOp",
                                        "VkAttachmentLoadOp  stencilLoadOp",
                                        "VkAttachmentStoreOp  stencilStoreOp",
                                        "VkImageLayout  initialLayout",
                                        "VkImageLayout  finalLayout"]

  VkAttachmentReference = struct ["uint32_t  attachment",
                                  "VkImageLayout  layout"]

  VkAttachmentReference2KHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "uint32_t  attachment",
                                      "VkImageLayout  layout",
                                      "VkImageAspectFlags  aspectMask"]

  VkExtent2D = struct ["uint32_t  width",
                       "uint32_t  height"]
  VkSampleLocationEXT = struct ["float  x",
                                "float  y"]
  VkSampleLocationsInfoEXT = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkSampleCountFlagBits  sampleLocationsPerPixel",
                                     { "sampleLocationGridSize" => VkExtent2D },
                                     "uint32_t  sampleLocationsCount",
                                     "VkSampleLocationEXT * pSampleLocations"]
  VkAttachmentSampleLocationsEXT = struct ["uint32_t  attachmentIndex",
                                           { "sampleLocationsInfo" => VkSampleLocationsInfoEXT }]

  VkBaseInStructure = struct ["VkStructureType  sType",
                              "VkBaseInStructure * pNext"]

  VkBaseOutStructure = struct ["VkStructureType  sType",
                               "VkBaseOutStructure * pNext"]

  VkBindAccelerationStructureMemoryInfoNV = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkAccelerationStructureNV  accelerationStructure",
                                                    "VkDeviceMemory  memory",
                                                    "VkDeviceSize  memoryOffset",
                                                    "uint32_t  deviceIndexCount",
                                                    "uint32_t * pDeviceIndices"]

  VkBindBufferMemoryDeviceGroupInfo = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "uint32_t  deviceIndexCount",
                                              "uint32_t * pDeviceIndices"]

  VkBindBufferMemoryDeviceGroupInfoKHR = VkBindBufferMemoryDeviceGroupInfo

  VkBindBufferMemoryInfo = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkBuffer  buffer",
                                   "VkDeviceMemory  memory",
                                   "VkDeviceSize  memoryOffset"]

  VkBindBufferMemoryInfoKHR = VkBindBufferMemoryInfo

  VkOffset2D = struct ["int32_t  x",
                       "int32_t  y"]
  VkRect2D = struct [{ "offset" => VkOffset2D },
                     { "extent" => VkExtent2D }]
  VkBindImageMemoryDeviceGroupInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  deviceIndexCount",
                                             "uint32_t * pDeviceIndices",
                                             "uint32_t  splitInstanceBindRegionCount",
                                             "VkRect2D * pSplitInstanceBindRegions"]

  VkBindImageMemoryDeviceGroupInfoKHR = VkBindImageMemoryDeviceGroupInfo

  VkBindImageMemoryInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkImage  image",
                                  "VkDeviceMemory  memory",
                                  "VkDeviceSize  memoryOffset"]

  VkBindImageMemoryInfoKHR = VkBindImageMemoryInfo

  VkBindImageMemorySwapchainInfoKHR = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkSwapchainKHR  swapchain",
                                              "uint32_t  imageIndex"]

  VkBindImagePlaneMemoryInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkImageAspectFlagBits  planeAspect"]

  VkBindImagePlaneMemoryInfoKHR = VkBindImagePlaneMemoryInfo

  VkSparseMemoryBind = struct ["VkDeviceSize  resourceOffset",
                               "VkDeviceSize  size",
                               "VkDeviceMemory  memory",
                               "VkDeviceSize  memoryOffset",
                               "VkSparseMemoryBindFlags  flags"]
  VkSparseBufferMemoryBindInfo = struct ["VkBuffer  buffer",
                                         "uint32_t  bindCount",
                                         "VkSparseMemoryBind * pBinds"]
  VkSparseImageOpaqueMemoryBindInfo = struct ["VkImage  image",
                                              "uint32_t  bindCount",
                                              "VkSparseMemoryBind * pBinds"]
  VkImageSubresource = struct ["VkImageAspectFlags  aspectMask",
                               "uint32_t  mipLevel",
                               "uint32_t  arrayLayer"]
  VkOffset3D = struct ["int32_t  x",
                       "int32_t  y",
                       "int32_t  z"]
  VkExtent3D = struct ["uint32_t  width",
                       "uint32_t  height",
                       "uint32_t  depth"]
  VkSparseImageMemoryBind = struct [{ "subresource" => VkImageSubresource },
                                    { "offset" => VkOffset3D },
                                    { "extent" => VkExtent3D },
                                    "VkDeviceMemory  memory",
                                    "VkDeviceSize  memoryOffset",
                                    "VkSparseMemoryBindFlags  flags"]
  VkSparseImageMemoryBindInfo = struct ["VkImage  image",
                                        "uint32_t  bindCount",
                                        "VkSparseImageMemoryBind * pBinds"]
  VkBindSparseInfo = struct ["VkStructureType  sType",
                             "void * pNext",
                             "uint32_t  waitSemaphoreCount",
                             "VkSemaphore * pWaitSemaphores",
                             "uint32_t  bufferBindCount",
                             "VkSparseBufferMemoryBindInfo * pBufferBinds",
                             "uint32_t  imageOpaqueBindCount",
                             "VkSparseImageOpaqueMemoryBindInfo * pImageOpaqueBinds",
                             "uint32_t  imageBindCount",
                             "VkSparseImageMemoryBindInfo * pImageBinds",
                             "uint32_t  signalSemaphoreCount",
                             "VkSemaphore * pSignalSemaphores"]

  VkBufferCopy = struct ["VkDeviceSize  srcOffset",
                         "VkDeviceSize  dstOffset",
                         "VkDeviceSize  size"]

  VkBufferCreateInfo = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkBufferCreateFlags  flags",
                               "VkDeviceSize  size",
                               "VkBufferUsageFlags  usage",
                               "VkSharingMode  sharingMode",
                               "uint32_t  queueFamilyIndexCount",
                               "uint32_t * pQueueFamilyIndices"]

  VkImageSubresourceLayers = struct ["VkImageAspectFlags  aspectMask",
                                     "uint32_t  mipLevel",
                                     "uint32_t  baseArrayLayer",
                                     "uint32_t  layerCount"]
  VkBufferImageCopy = struct ["VkDeviceSize  bufferOffset",
                              "uint32_t  bufferRowLength",
                              "uint32_t  bufferImageHeight",
                              { "imageSubresource" => VkImageSubresourceLayers },
                              { "imageOffset" => VkOffset3D },
                              { "imageExtent" => VkExtent3D }]

  VkBufferMemoryBarrier = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkAccessFlags  srcAccessMask",
                                  "VkAccessFlags  dstAccessMask",
                                  "uint32_t  srcQueueFamilyIndex",
                                  "uint32_t  dstQueueFamilyIndex",
                                  "VkBuffer  buffer",
                                  "VkDeviceSize  offset",
                                  "VkDeviceSize  size"]

  VkBufferMemoryRequirementsInfo2 = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkBuffer  buffer"]

  VkBufferMemoryRequirementsInfo2KHR = VkBufferMemoryRequirementsInfo2

  VkBufferViewCreateInfo = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkBufferViewCreateFlags  flags",
                                   "VkBuffer  buffer",
                                   "VkFormat  format",
                                   "VkDeviceSize  offset",
                                   "VkDeviceSize  range"]

  VkCalibratedTimestampInfoEXT = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkTimeDomainEXT  timeDomain"]

  VkCheckpointDataNV = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkPipelineStageFlagBits  stage",
                               "void * pCheckpointMarker"]

  # Union allowing specification of floating point, integer, or unsigned integer color data. Actual value selected is based on image/attachment being cleared.
  VkClearColorValue = union ["float  float32 [4]",
                             "int32_t  int32 [4]",
                             "uint32_t  uint32 [4]"]
  VkClearDepthStencilValue = struct ["float  depth",
                                     "uint32_t  stencil"]
  # Union allowing specification of color or depth and stencil values. Actual value selected is based on attachment being cleared.
  VkClearValue = union [{ "color" => VkClearColorValue },
                        { "depthStencil" => VkClearDepthStencilValue }]
  VkClearAttachment = struct ["VkImageAspectFlags  aspectMask",
                              "uint32_t  colorAttachment",
                              { "clearValue" => VkClearValue }]

  VkClearRect = struct [{ "rect" => VkRect2D },
                        "uint32_t  baseArrayLayer",
                        "uint32_t  layerCount"]

  VkIndirectCommandsTokenNVX = struct ["VkIndirectCommandsTokenTypeNVX  tokenType",
                                       "VkBuffer  buffer",
                                       "VkDeviceSize  offset"]
  VkCmdProcessCommandsInfoNVX = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkObjectTableNVX  objectTable",
                                        "VkIndirectCommandsLayoutNVX  indirectCommandsLayout",
                                        "uint32_t  indirectCommandsTokenCount",
                                        "VkIndirectCommandsTokenNVX * pIndirectCommandsTokens",
                                        "uint32_t  maxSequencesCount",
                                        "VkCommandBuffer  targetCommandBuffer",
                                        "VkBuffer  sequencesCountBuffer",
                                        "VkDeviceSize  sequencesCountOffset",
                                        "VkBuffer  sequencesIndexBuffer",
                                        "VkDeviceSize  sequencesIndexOffset"]

  VkCmdReserveSpaceForCommandsInfoNVX = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkObjectTableNVX  objectTable",
                                                "VkIndirectCommandsLayoutNVX  indirectCommandsLayout",
                                                "uint32_t  maxSequencesCount"]

  VkCoarseSampleLocationNV = struct ["uint32_t  pixelX",
                                     "uint32_t  pixelY",
                                     "uint32_t  sample"]

  VkCoarseSampleOrderCustomNV = struct ["VkShadingRatePaletteEntryNV  shadingRate",
                                        "uint32_t  sampleCount",
                                        "uint32_t  sampleLocationCount",
                                        "VkCoarseSampleLocationNV * pSampleLocations"]

  VkCommandBufferAllocateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkCommandPool  commandPool",
                                        "VkCommandBufferLevel  level",
                                        "uint32_t  commandBufferCount"]

  VkCommandBufferInheritanceInfo = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkRenderPass  renderPass",
                                           "uint32_t  subpass",
                                           "VkFramebuffer  framebuffer",
                                           "VkBool32  occlusionQueryEnable",
                                           "VkQueryControlFlags  queryFlags",
                                           "VkQueryPipelineStatisticFlags  pipelineStatistics"]
  VkCommandBufferBeginInfo = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkCommandBufferUsageFlags  flags",
                                     "VkCommandBufferInheritanceInfo * pInheritanceInfo"]

  VkCommandBufferInheritanceConditionalRenderingInfoEXT = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "VkBool32  conditionalRenderingEnable"]

  VkCommandPoolCreateInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkCommandPoolCreateFlags  flags",
                                    "uint32_t  queueFamilyIndex"]

  VkSpecializationMapEntry = struct ["uint32_t  constantID",
                                     "uint32_t  offset",
                                     "size_t  size"]
  VkSpecializationInfo = struct ["uint32_t  mapEntryCount",
                                 "VkSpecializationMapEntry * pMapEntries",
                                 "size_t  dataSize",
                                 "void * pData"]
  VkPipelineShaderStageCreateInfo = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkPipelineShaderStageCreateFlags  flags",
                                            "VkShaderStageFlagBits  stage",
                                            "VkShaderModule  module",
                                            "char * pName",
                                            "VkSpecializationInfo * pSpecializationInfo"]
  VkComputePipelineCreateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkPipelineCreateFlags  flags",
                                        { "stage" => VkPipelineShaderStageCreateInfo },
                                        "VkPipelineLayout  layout",
                                        "VkPipeline  basePipelineHandle",
                                        "int32_t  basePipelineIndex"]

  VkConditionalRenderingBeginInfoEXT = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkBuffer  buffer",
                                               "VkDeviceSize  offset",
                                               "VkConditionalRenderingFlagsEXT  flags"]

  VkConformanceVersionKHR = struct ["uint8_t  major",
                                    "uint8_t  minor",
                                    "uint8_t  subminor",
                                    "uint8_t  patch"]

  VkCopyDescriptorSet = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkDescriptorSet  srcSet",
                                "uint32_t  srcBinding",
                                "uint32_t  srcArrayElement",
                                "VkDescriptorSet  dstSet",
                                "uint32_t  dstBinding",
                                "uint32_t  dstArrayElement",
                                "uint32_t  descriptorCount"]

  VkD3D12FenceSubmitInfoKHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "uint32_t  waitSemaphoreValuesCount",
                                      "uint64_t * pWaitSemaphoreValues",
                                      "uint32_t  signalSemaphoreValuesCount",
                                      "uint64_t * pSignalSemaphoreValues"]

  VkDebugMarkerMarkerInfoEXT = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "char * pMarkerName",
                                       "float  color [4]"]

  VkDebugMarkerObjectNameInfoEXT = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkDebugReportObjectTypeEXT  objectType",
                                           "uint64_t  object",
                                           "char * pObjectName"]

  VkDebugMarkerObjectTagInfoEXT = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkDebugReportObjectTypeEXT  objectType",
                                          "uint64_t  object",
                                          "uint64_t  tagName",
                                          "size_t  tagSize",
                                          "void * pTag"]

  VkDebugReportCallbackCreateInfoEXT = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkDebugReportFlagsEXT  flags",
                                               "PFN_vkDebugReportCallbackEXT  pfnCallback",
                                               "void * pUserData"]

  VkDebugUtilsLabelEXT = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "char * pLabelName",
                                 "float  color [4]"]

  VkDebugUtilsObjectNameInfoEXT = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkObjectType  objectType",
                                          "uint64_t  objectHandle",
                                          "char * pObjectName"]
  VkDebugUtilsMessengerCallbackDataEXT = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkDebugUtilsMessengerCallbackDataFlagsEXT  flags",
                                                 "char * pMessageIdName",
                                                 "int32_t  messageIdNumber",
                                                 "char * pMessage",
                                                 "uint32_t  queueLabelCount",
                                                 "VkDebugUtilsLabelEXT * pQueueLabels",
                                                 "uint32_t  cmdBufLabelCount",
                                                 "VkDebugUtilsLabelEXT * pCmdBufLabels",
                                                 "uint32_t  objectCount",
                                                 "VkDebugUtilsObjectNameInfoEXT * pObjects"]

  VkDebugUtilsMessengerCreateInfoEXT = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkDebugUtilsMessengerCreateFlagsEXT  flags",
                                               "VkDebugUtilsMessageSeverityFlagsEXT  messageSeverity",
                                               "VkDebugUtilsMessageTypeFlagsEXT  messageType",
                                               "PFN_vkDebugUtilsMessengerCallbackEXT  pfnUserCallback",
                                               "void * pUserData"]

  VkDebugUtilsObjectTagInfoEXT = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkObjectType  objectType",
                                         "uint64_t  objectHandle",
                                         "uint64_t  tagName",
                                         "size_t  tagSize",
                                         "void * pTag"]

  VkDedicatedAllocationBufferCreateInfoNV = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkBool32  dedicatedAllocation"]

  VkDedicatedAllocationImageCreateInfoNV = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkBool32  dedicatedAllocation"]

  VkDedicatedAllocationMemoryAllocateInfoNV = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkImage  image",
                                                      "VkBuffer  buffer"]

  VkDescriptorBufferInfo = struct ["VkBuffer  buffer",
                                   "VkDeviceSize  offset",
                                   "VkDeviceSize  range"]

  VkDescriptorImageInfo = struct ["VkSampler  sampler",
                                  "VkImageView  imageView",
                                  "VkImageLayout  imageLayout"]

  VkDescriptorPoolSize = struct ["VkDescriptorType  type",
                                 "uint32_t  descriptorCount"]
  VkDescriptorPoolCreateInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkDescriptorPoolCreateFlags  flags",
                                       "uint32_t  maxSets",
                                       "uint32_t  poolSizeCount",
                                       "VkDescriptorPoolSize * pPoolSizes"]

  VkDescriptorPoolInlineUniformBlockCreateInfoEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "uint32_t  maxInlineUniformBlockBindings"]

  VkDescriptorSetAllocateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkDescriptorPool  descriptorPool",
                                        "uint32_t  descriptorSetCount",
                                        "VkDescriptorSetLayout * pSetLayouts"]

  VkDescriptorSetLayoutBinding = struct ["uint32_t  binding",
                                         "VkDescriptorType  descriptorType",
                                         "uint32_t  descriptorCount",
                                         "VkShaderStageFlags  stageFlags",
                                         "VkSampler * pImmutableSamplers"]

  VkDescriptorSetLayoutBindingFlagsCreateInfoEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "uint32_t  bindingCount",
                                                           "VkDescriptorBindingFlagsEXT * pBindingFlags"]

  VkDescriptorSetLayoutCreateInfo = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkDescriptorSetLayoutCreateFlags  flags",
                                            "uint32_t  bindingCount",
                                            "VkDescriptorSetLayoutBinding * pBindings"]

  VkDescriptorSetLayoutSupport = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkBool32  supported"]

  VkDescriptorSetLayoutSupportKHR = VkDescriptorSetLayoutSupport

  VkDescriptorSetVariableDescriptorCountAllocateInfoEXT = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "uint32_t  descriptorSetCount",
                                                                  "uint32_t * pDescriptorCounts"]

  VkDescriptorSetVariableDescriptorCountLayoutSupportEXT = struct ["VkStructureType  sType",
                                                                   "void * pNext",
                                                                   "uint32_t  maxVariableDescriptorCount"]

  VkDescriptorUpdateTemplateEntry = struct ["uint32_t  dstBinding",
                                            "uint32_t  dstArrayElement",
                                            "uint32_t  descriptorCount",
                                            "VkDescriptorType  descriptorType",
                                            "size_t  offset",
                                            "size_t  stride"]
  VkDescriptorUpdateTemplateCreateInfo = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkDescriptorUpdateTemplateCreateFlags  flags",
                                                 "uint32_t  descriptorUpdateEntryCount",
                                                 "VkDescriptorUpdateTemplateEntry * pDescriptorUpdateEntries",
                                                 "VkDescriptorUpdateTemplateType  templateType",
                                                 "VkDescriptorSetLayout  descriptorSetLayout",
                                                 "VkPipelineBindPoint  pipelineBindPoint",
                                                 "VkPipelineLayout  pipelineLayout",
                                                 "uint32_t  set"]

  VkDescriptorUpdateTemplateCreateInfoKHR = VkDescriptorUpdateTemplateCreateInfo

  VkDescriptorUpdateTemplateEntryKHR = VkDescriptorUpdateTemplateEntry

  VkDeviceQueueCreateInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkDeviceQueueCreateFlags  flags",
                                    "uint32_t  queueFamilyIndex",
                                    "uint32_t  queueCount",
                                    "float * pQueuePriorities"]
  VkPhysicalDeviceFeatures = struct ["VkBool32  robustBufferAccess",
                                     "VkBool32  fullDrawIndexUint32",
                                     "VkBool32  imageCubeArray",
                                     "VkBool32  independentBlend",
                                     "VkBool32  geometryShader",
                                     "VkBool32  tessellationShader",
                                     "VkBool32  sampleRateShading",
                                     "VkBool32  dualSrcBlend",
                                     "VkBool32  logicOp",
                                     "VkBool32  multiDrawIndirect",
                                     "VkBool32  drawIndirectFirstInstance",
                                     "VkBool32  depthClamp",
                                     "VkBool32  depthBiasClamp",
                                     "VkBool32  fillModeNonSolid",
                                     "VkBool32  depthBounds",
                                     "VkBool32  wideLines",
                                     "VkBool32  largePoints",
                                     "VkBool32  alphaToOne",
                                     "VkBool32  multiViewport",
                                     "VkBool32  samplerAnisotropy",
                                     "VkBool32  textureCompressionETC2",
                                     "VkBool32  textureCompressionASTC_LDR",
                                     "VkBool32  textureCompressionBC",
                                     "VkBool32  occlusionQueryPrecise",
                                     "VkBool32  pipelineStatisticsQuery",
                                     "VkBool32  vertexPipelineStoresAndAtomics",
                                     "VkBool32  fragmentStoresAndAtomics",
                                     "VkBool32  shaderTessellationAndGeometryPointSize",
                                     "VkBool32  shaderImageGatherExtended",
                                     "VkBool32  shaderStorageImageExtendedFormats",
                                     "VkBool32  shaderStorageImageMultisample",
                                     "VkBool32  shaderStorageImageReadWithoutFormat",
                                     "VkBool32  shaderStorageImageWriteWithoutFormat",
                                     "VkBool32  shaderUniformBufferArrayDynamicIndexing",
                                     "VkBool32  shaderSampledImageArrayDynamicIndexing",
                                     "VkBool32  shaderStorageBufferArrayDynamicIndexing",
                                     "VkBool32  shaderStorageImageArrayDynamicIndexing",
                                     "VkBool32  shaderClipDistance",
                                     "VkBool32  shaderCullDistance",
                                     "VkBool32  shaderFloat64",
                                     "VkBool32  shaderInt64",
                                     "VkBool32  shaderInt16",
                                     "VkBool32  shaderResourceResidency",
                                     "VkBool32  shaderResourceMinLod",
                                     "VkBool32  sparseBinding",
                                     "VkBool32  sparseResidencyBuffer",
                                     "VkBool32  sparseResidencyImage2D",
                                     "VkBool32  sparseResidencyImage3D",
                                     "VkBool32  sparseResidency2Samples",
                                     "VkBool32  sparseResidency4Samples",
                                     "VkBool32  sparseResidency8Samples",
                                     "VkBool32  sparseResidency16Samples",
                                     "VkBool32  sparseResidencyAliased",
                                     "VkBool32  variableMultisampleRate",
                                     "VkBool32  inheritedQueries"]
  VkDeviceCreateInfo = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkDeviceCreateFlags  flags",
                               "uint32_t  queueCreateInfoCount",
                               "VkDeviceQueueCreateInfo * pQueueCreateInfos",
                               "uint32_t  enabledLayerCount",
                               "char * ppEnabledLayerNames",
                               "uint32_t  enabledExtensionCount",
                               "char * ppEnabledExtensionNames",
                               "VkPhysicalDeviceFeatures * pEnabledFeatures"]

  VkDeviceEventInfoEXT = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkDeviceEventTypeEXT  deviceEvent"]

  VkDeviceGeneratedCommandsFeaturesNVX = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkBool32  computeBindingPointSupport"]

  VkDeviceGeneratedCommandsLimitsNVX = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "uint32_t  maxIndirectCommandsLayoutTokenCount",
                                               "uint32_t  maxObjectEntryCounts",
                                               "uint32_t  minSequenceCountBufferOffsetAlignment",
                                               "uint32_t  minSequenceIndexBufferOffsetAlignment",
                                               "uint32_t  minCommandsTokenBufferOffsetAlignment"]

  VkDeviceGroupBindSparseInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "uint32_t  resourceDeviceIndex",
                                        "uint32_t  memoryDeviceIndex"]

  VkDeviceGroupBindSparseInfoKHR = VkDeviceGroupBindSparseInfo

  VkDeviceGroupCommandBufferBeginInfo = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  deviceMask"]

  VkDeviceGroupCommandBufferBeginInfoKHR = VkDeviceGroupCommandBufferBeginInfo

  VkDeviceGroupDeviceCreateInfo = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "uint32_t  physicalDeviceCount",
                                          "VkPhysicalDevice * pPhysicalDevices"]

  VkDeviceGroupDeviceCreateInfoKHR = VkDeviceGroupDeviceCreateInfo

  VkDeviceGroupPresentCapabilitiesKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  presentMask[#{VK_MAX_DEVICE_GROUP_SIZE}]",
                                                "VkDeviceGroupPresentModeFlagsKHR  modes"]

  VkDeviceGroupPresentInfoKHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "uint32_t  swapchainCount",
                                        "uint32_t * pDeviceMasks",
                                        "VkDeviceGroupPresentModeFlagBitsKHR  mode"]

  VkDeviceGroupRenderPassBeginInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  deviceMask",
                                             "uint32_t  deviceRenderAreaCount",
                                             "VkRect2D * pDeviceRenderAreas"]

  VkDeviceGroupRenderPassBeginInfoKHR = VkDeviceGroupRenderPassBeginInfo

  VkDeviceGroupSubmitInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "uint32_t  waitSemaphoreCount",
                                    "uint32_t * pWaitSemaphoreDeviceIndices",
                                    "uint32_t  commandBufferCount",
                                    "uint32_t * pCommandBufferDeviceMasks",
                                    "uint32_t  signalSemaphoreCount",
                                    "uint32_t * pSignalSemaphoreDeviceIndices"]

  VkDeviceGroupSubmitInfoKHR = VkDeviceGroupSubmitInfo

  VkDeviceGroupSwapchainCreateInfoKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkDeviceGroupPresentModeFlagsKHR  modes"]

  VkDeviceMemoryOverallocationCreateInfoAMD = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkMemoryOverallocationBehaviorAMD  overallocationBehavior"]

  VkDeviceQueueGlobalPriorityCreateInfoEXT = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkQueueGlobalPriorityEXT  globalPriority"]

  VkDeviceQueueInfo2 = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkDeviceQueueCreateFlags  flags",
                               "uint32_t  queueFamilyIndex",
                               "uint32_t  queueIndex"]

  VkDispatchIndirectCommand = struct ["uint32_t  x",
                                      "uint32_t  y",
                                      "uint32_t  z"]

  VkDisplayEventInfoEXT = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkDisplayEventTypeEXT  displayEvent"]

  VkDisplayModeParametersKHR = struct [{ "visibleRegion" => VkExtent2D },
                                       "uint32_t  refreshRate"]
  VkDisplayModeCreateInfoKHR = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkDisplayModeCreateFlagsKHR  flags",
                                       { "parameters" => VkDisplayModeParametersKHR }]

  VkDisplayModePropertiesKHR = struct ["VkDisplayModeKHR  displayMode",
                                       { "parameters" => VkDisplayModeParametersKHR }]
  VkDisplayModeProperties2KHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        { "displayModeProperties" => VkDisplayModePropertiesKHR }]

  VkDisplayPlaneCapabilitiesKHR = struct ["VkDisplayPlaneAlphaFlagsKHR  supportedAlpha",
                                          { "minSrcPosition" => VkOffset2D },
                                          { "maxSrcPosition" => VkOffset2D },
                                          { "minSrcExtent" => VkExtent2D },
                                          { "maxSrcExtent" => VkExtent2D },
                                          { "minDstPosition" => VkOffset2D },
                                          { "maxDstPosition" => VkOffset2D },
                                          { "minDstExtent" => VkExtent2D },
                                          { "maxDstExtent" => VkExtent2D }]
  VkDisplayPlaneCapabilities2KHR = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           { "capabilities" => VkDisplayPlaneCapabilitiesKHR }]

  VkDisplayPlaneInfo2KHR = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkDisplayModeKHR  mode",
                                   "uint32_t  planeIndex"]

  VkDisplayPlanePropertiesKHR = struct ["VkDisplayKHR  currentDisplay",
                                        "uint32_t  currentStackIndex"]
  VkDisplayPlaneProperties2KHR = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         { "displayPlaneProperties" => VkDisplayPlanePropertiesKHR }]

  VkDisplayPowerInfoEXT = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkDisplayPowerStateEXT  powerState"]

  VkDisplayPresentInfoKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    { "srcRect" => VkRect2D },
                                    { "dstRect" => VkRect2D },
                                    "VkBool32  persistent"]

  VkDisplayPropertiesKHR = struct ["VkDisplayKHR  display",
                                   "char * displayName",
                                   { "physicalDimensions" => VkExtent2D },
                                   { "physicalResolution" => VkExtent2D },
                                   "VkSurfaceTransformFlagsKHR  supportedTransforms",
                                   "VkBool32  planeReorderPossible",
                                   "VkBool32  persistentContent"]
  VkDisplayProperties2KHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    { "displayProperties" => VkDisplayPropertiesKHR }]

  VkDisplaySurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkDisplaySurfaceCreateFlagsKHR  flags",
                                          "VkDisplayModeKHR  displayMode",
                                          "uint32_t  planeIndex",
                                          "uint32_t  planeStackIndex",
                                          "VkSurfaceTransformFlagBitsKHR  transform",
                                          "float  globalAlpha",
                                          "VkDisplayPlaneAlphaFlagBitsKHR  alphaMode",
                                          { "imageExtent" => VkExtent2D }]

  VkDrawIndexedIndirectCommand = struct ["uint32_t  indexCount",
                                         "uint32_t  instanceCount",
                                         "uint32_t  firstIndex",
                                         "int32_t  vertexOffset",
                                         "uint32_t  firstInstance"]

  VkDrawIndirectCommand = struct ["uint32_t  vertexCount",
                                  "uint32_t  instanceCount",
                                  "uint32_t  firstVertex",
                                  "uint32_t  firstInstance"]

  VkDrawMeshTasksIndirectCommandNV = struct ["uint32_t  taskCount",
                                             "uint32_t  firstTask"]

  VkDrmFormatModifierPropertiesEXT = struct ["uint64_t  drmFormatModifier",
                                             "uint32_t  drmFormatModifierPlaneCount",
                                             "VkFormatFeatureFlags  drmFormatModifierTilingFeatures"]

  VkDrmFormatModifierPropertiesListEXT = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "uint32_t  drmFormatModifierCount",
                                                 "VkDrmFormatModifierPropertiesEXT * pDrmFormatModifierProperties"]

  VkEventCreateInfo = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkEventCreateFlags  flags"]

  VkExportFenceCreateInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkExternalFenceHandleTypeFlags  handleTypes"]

  VkExportFenceCreateInfoKHR = VkExportFenceCreateInfo

  VkExportFenceWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "SECURITY_ATTRIBUTES * pAttributes",
                                            "DWORD  dwAccess",
                                            "LPCWSTR  name"]

  VkExportMemoryAllocateInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkExternalMemoryHandleTypeFlags  handleTypes"]

  VkExportMemoryAllocateInfoKHR = VkExportMemoryAllocateInfo

  VkExportMemoryAllocateInfoNV = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkExternalMemoryHandleTypeFlagsNV  handleTypes"]

  VkExportMemoryWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "SECURITY_ATTRIBUTES * pAttributes",
                                             "DWORD  dwAccess",
                                             "LPCWSTR  name"]

  VkExportMemoryWin32HandleInfoNV = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "SECURITY_ATTRIBUTES * pAttributes",
                                            "DWORD  dwAccess"]

  VkExportSemaphoreCreateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkExternalSemaphoreHandleTypeFlags  handleTypes"]

  VkExportSemaphoreCreateInfoKHR = VkExportSemaphoreCreateInfo

  VkExportSemaphoreWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "SECURITY_ATTRIBUTES * pAttributes",
                                                "DWORD  dwAccess",
                                                "LPCWSTR  name"]

  VkExtensionProperties = struct ["char  extensionName[#{VK_MAX_EXTENSION_NAME_SIZE}]",
                                  "uint32_t  specVersion"]

  VkExternalMemoryProperties = struct ["VkExternalMemoryFeatureFlags  externalMemoryFeatures",
                                       "VkExternalMemoryHandleTypeFlags  exportFromImportedHandleTypes",
                                       "VkExternalMemoryHandleTypeFlags  compatibleHandleTypes"]
  VkExternalBufferProperties = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       { "externalMemoryProperties" => VkExternalMemoryProperties }]

  VkExternalBufferPropertiesKHR = VkExternalBufferProperties

  VkExternalFenceProperties = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkExternalFenceHandleTypeFlags  exportFromImportedHandleTypes",
                                      "VkExternalFenceHandleTypeFlags  compatibleHandleTypes",
                                      "VkExternalFenceFeatureFlags  externalFenceFeatures"]

  VkExternalFencePropertiesKHR = VkExternalFenceProperties

  VkExternalFormatANDROID = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "uint64_t  externalFormat"]

  VkExternalImageFormatProperties = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            { "externalMemoryProperties" => VkExternalMemoryProperties }]

  VkExternalImageFormatPropertiesKHR = VkExternalImageFormatProperties

  VkImageFormatProperties = struct [{ "maxExtent" => VkExtent3D },
                                    "uint32_t  maxMipLevels",
                                    "uint32_t  maxArrayLayers",
                                    "VkSampleCountFlags  sampleCounts",
                                    "VkDeviceSize  maxResourceSize"]
  VkExternalImageFormatPropertiesNV = struct [{ "imageFormatProperties" => VkImageFormatProperties },
                                              "VkExternalMemoryFeatureFlagsNV  externalMemoryFeatures",
                                              "VkExternalMemoryHandleTypeFlagsNV  exportFromImportedHandleTypes",
                                              "VkExternalMemoryHandleTypeFlagsNV  compatibleHandleTypes"]

  VkExternalMemoryBufferCreateInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkExternalMemoryHandleTypeFlags  handleTypes"]

  VkExternalMemoryBufferCreateInfoKHR = VkExternalMemoryBufferCreateInfo

  VkExternalMemoryImageCreateInfo = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkExternalMemoryHandleTypeFlags  handleTypes"]

  VkExternalMemoryImageCreateInfoKHR = VkExternalMemoryImageCreateInfo

  VkExternalMemoryImageCreateInfoNV = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkExternalMemoryHandleTypeFlagsNV  handleTypes"]

  VkExternalMemoryPropertiesKHR = VkExternalMemoryProperties

  VkExternalSemaphoreProperties = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkExternalSemaphoreHandleTypeFlags  exportFromImportedHandleTypes",
                                          "VkExternalSemaphoreHandleTypeFlags  compatibleHandleTypes",
                                          "VkExternalSemaphoreFeatureFlags  externalSemaphoreFeatures"]

  VkExternalSemaphorePropertiesKHR = VkExternalSemaphoreProperties

  VkFenceCreateInfo = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkFenceCreateFlags  flags"]

  VkFenceGetFdInfoKHR = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkFence  fence",
                                "VkExternalFenceHandleTypeFlagBits  handleType"]

  VkFenceGetWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkFence  fence",
                                         "VkExternalFenceHandleTypeFlagBits  handleType"]

  VkFormatProperties = struct ["VkFormatFeatureFlags  linearTilingFeatures",
                               "VkFormatFeatureFlags  optimalTilingFeatures",
                               "VkFormatFeatureFlags  bufferFeatures"]

  VkFormatProperties2 = struct ["VkStructureType  sType",
                                "void * pNext",
                                { "formatProperties" => VkFormatProperties }]

  VkFormatProperties2KHR = VkFormatProperties2

  VkFramebufferCreateInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkFramebufferCreateFlags  flags",
                                    "VkRenderPass  renderPass",
                                    "uint32_t  attachmentCount",
                                    "VkImageView * pAttachments",
                                    "uint32_t  width",
                                    "uint32_t  height",
                                    "uint32_t  layers"]

  VkVertexInputBindingDescription = struct ["uint32_t  binding",
                                            "uint32_t  stride",
                                            "VkVertexInputRate  inputRate"]
  VkVertexInputAttributeDescription = struct ["uint32_t  location",
                                              "uint32_t  binding",
                                              "VkFormat  format",
                                              "uint32_t  offset"]
  VkPipelineVertexInputStateCreateInfo = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkPipelineVertexInputStateCreateFlags  flags",
                                                 "uint32_t  vertexBindingDescriptionCount",
                                                 "VkVertexInputBindingDescription * pVertexBindingDescriptions",
                                                 "uint32_t  vertexAttributeDescriptionCount",
                                                 "VkVertexInputAttributeDescription * pVertexAttributeDescriptions"]
  VkPipelineInputAssemblyStateCreateInfo = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkPipelineInputAssemblyStateCreateFlags  flags",
                                                   "VkPrimitiveTopology  topology",
                                                   "VkBool32  primitiveRestartEnable"]
  VkPipelineTessellationStateCreateInfo = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkPipelineTessellationStateCreateFlags  flags",
                                                  "uint32_t  patchControlPoints"]
  VkViewport = struct ["float  x",
                       "float  y",
                       "float  width",
                       "float  height",
                       "float  minDepth",
                       "float  maxDepth"]
  VkPipelineViewportStateCreateInfo = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkPipelineViewportStateCreateFlags  flags",
                                              "uint32_t  viewportCount",
                                              "VkViewport * pViewports",
                                              "uint32_t  scissorCount",
                                              "VkRect2D * pScissors"]
  VkPipelineRasterizationStateCreateInfo = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkPipelineRasterizationStateCreateFlags  flags",
                                                   "VkBool32  depthClampEnable",
                                                   "VkBool32  rasterizerDiscardEnable",
                                                   "VkPolygonMode  polygonMode",
                                                   "VkCullModeFlags  cullMode",
                                                   "VkFrontFace  frontFace",
                                                   "VkBool32  depthBiasEnable",
                                                   "float  depthBiasConstantFactor",
                                                   "float  depthBiasClamp",
                                                   "float  depthBiasSlopeFactor",
                                                   "float  lineWidth"]
  VkPipelineMultisampleStateCreateInfo = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkPipelineMultisampleStateCreateFlags  flags",
                                                 "VkSampleCountFlagBits  rasterizationSamples",
                                                 "VkBool32  sampleShadingEnable",
                                                 "float  minSampleShading",
                                                 "VkSampleMask * pSampleMask",
                                                 "VkBool32  alphaToCoverageEnable",
                                                 "VkBool32  alphaToOneEnable"]
  VkStencilOpState = struct ["VkStencilOp  failOp",
                             "VkStencilOp  passOp",
                             "VkStencilOp  depthFailOp",
                             "VkCompareOp  compareOp",
                             "uint32_t  compareMask",
                             "uint32_t  writeMask",
                             "uint32_t  reference"]
  VkPipelineDepthStencilStateCreateInfo = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkPipelineDepthStencilStateCreateFlags  flags",
                                                  "VkBool32  depthTestEnable",
                                                  "VkBool32  depthWriteEnable",
                                                  "VkCompareOp  depthCompareOp",
                                                  "VkBool32  depthBoundsTestEnable",
                                                  "VkBool32  stencilTestEnable",
                                                  { "front" => VkStencilOpState },
                                                  { "back" => VkStencilOpState },
                                                  "float  minDepthBounds",
                                                  "float  maxDepthBounds"]
  VkPipelineColorBlendAttachmentState = struct ["VkBool32  blendEnable",
                                                "VkBlendFactor  srcColorBlendFactor",
                                                "VkBlendFactor  dstColorBlendFactor",
                                                "VkBlendOp  colorBlendOp",
                                                "VkBlendFactor  srcAlphaBlendFactor",
                                                "VkBlendFactor  dstAlphaBlendFactor",
                                                "VkBlendOp  alphaBlendOp",
                                                "VkColorComponentFlags  colorWriteMask"]
  VkPipelineColorBlendStateCreateInfo = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkPipelineColorBlendStateCreateFlags  flags",
                                                "VkBool32  logicOpEnable",
                                                "VkLogicOp  logicOp",
                                                "uint32_t  attachmentCount",
                                                "VkPipelineColorBlendAttachmentState * pAttachments",
                                                "float  blendConstants [4]"]
  VkPipelineDynamicStateCreateInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkPipelineDynamicStateCreateFlags  flags",
                                             "uint32_t  dynamicStateCount",
                                             "VkDynamicState * pDynamicStates"]
  VkGraphicsPipelineCreateInfo = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkPipelineCreateFlags  flags",
                                         "uint32_t  stageCount",
                                         "VkPipelineShaderStageCreateInfo * pStages",
                                         "VkPipelineVertexInputStateCreateInfo * pVertexInputState",
                                         "VkPipelineInputAssemblyStateCreateInfo * pInputAssemblyState",
                                         "VkPipelineTessellationStateCreateInfo * pTessellationState",
                                         "VkPipelineViewportStateCreateInfo * pViewportState",
                                         "VkPipelineRasterizationStateCreateInfo * pRasterizationState",
                                         "VkPipelineMultisampleStateCreateInfo * pMultisampleState",
                                         "VkPipelineDepthStencilStateCreateInfo * pDepthStencilState",
                                         "VkPipelineColorBlendStateCreateInfo * pColorBlendState",
                                         "VkPipelineDynamicStateCreateInfo * pDynamicState",
                                         "VkPipelineLayout  layout",
                                         "VkRenderPass  renderPass",
                                         "uint32_t  subpass",
                                         "VkPipeline  basePipelineHandle",
                                         "int32_t  basePipelineIndex"]

  # Chromaticity coordinate
  VkXYColorEXT = struct ["float  x",
                         "float  y"]
  VkHdrMetadataEXT = struct ["VkStructureType  sType",
                             "void * pNext",
                             { "displayPrimaryRed" => VkXYColorEXT },
                             { "displayPrimaryGreen" => VkXYColorEXT },
                             { "displayPrimaryBlue" => VkXYColorEXT },
                             { "whitePoint" => VkXYColorEXT },
                             "float  maxLuminance",
                             "float  minLuminance",
                             "float  maxContentLightLevel",
                             "float  maxFrameAverageLightLevel"]

  VkIOSSurfaceCreateInfoMVK = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkIOSSurfaceCreateFlagsMVK  flags",
                                      "void * pView"]

  VkImageBlit = struct [{ "srcSubresource" => VkImageSubresourceLayers },
                        { "srcOffsets[2]" => VkOffset3D },
                        { "dstSubresource" => VkImageSubresourceLayers },
                        { "dstOffsets[2]" => VkOffset3D }]

  VkImageCopy = struct [{ "srcSubresource" => VkImageSubresourceLayers },
                        { "srcOffset" => VkOffset3D },
                        { "dstSubresource" => VkImageSubresourceLayers },
                        { "dstOffset" => VkOffset3D },
                        { "extent" => VkExtent3D }]

  VkImageCreateInfo = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkImageCreateFlags  flags",
                              "VkImageType  imageType",
                              "VkFormat  format",
                              { "extent" => VkExtent3D },
                              "uint32_t  mipLevels",
                              "uint32_t  arrayLayers",
                              "VkSampleCountFlagBits  samples",
                              "VkImageTiling  tiling",
                              "VkImageUsageFlags  usage",
                              "VkSharingMode  sharingMode",
                              "uint32_t  queueFamilyIndexCount",
                              "uint32_t * pQueueFamilyIndices",
                              "VkImageLayout  initialLayout"]

  VkSubresourceLayout = struct ["VkDeviceSize  offset",
                                "VkDeviceSize  size",
                                "VkDeviceSize  rowPitch",
                                "VkDeviceSize  arrayPitch",
                                "VkDeviceSize  depthPitch"]
  VkImageDrmFormatModifierExplicitCreateInfoEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "uint64_t  drmFormatModifier",
                                                          "uint32_t  drmFormatModifierPlaneCount",
                                                          "VkSubresourceLayout * pPlaneLayouts"]

  VkImageDrmFormatModifierListCreateInfoEXT = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "uint32_t  drmFormatModifierCount",
                                                      "uint64_t * pDrmFormatModifiers"]

  VkImageDrmFormatModifierPropertiesEXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "uint64_t  drmFormatModifier"]

  VkImageFormatListCreateInfoKHR = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "uint32_t  viewFormatCount",
                                           "VkFormat * pViewFormats"]

  VkImageFormatProperties2 = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     { "imageFormatProperties" => VkImageFormatProperties }]

  VkImageFormatProperties2KHR = VkImageFormatProperties2

  VkImageSubresourceRange = struct ["VkImageAspectFlags  aspectMask",
                                    "uint32_t  baseMipLevel",
                                    "uint32_t  levelCount",
                                    "uint32_t  baseArrayLayer",
                                    "uint32_t  layerCount"]
  VkImageMemoryBarrier = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkAccessFlags  srcAccessMask",
                                 "VkAccessFlags  dstAccessMask",
                                 "VkImageLayout  oldLayout",
                                 "VkImageLayout  newLayout",
                                 "uint32_t  srcQueueFamilyIndex",
                                 "uint32_t  dstQueueFamilyIndex",
                                 "VkImage  image",
                                 { "subresourceRange" => VkImageSubresourceRange }]

  VkImageMemoryRequirementsInfo2 = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkImage  image"]

  VkImageMemoryRequirementsInfo2KHR = VkImageMemoryRequirementsInfo2

  VkImagePipeSurfaceCreateInfoFUCHSIA = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkImagePipeSurfaceCreateFlagsFUCHSIA  flags",
                                                "zx_handle_t  imagePipeHandle"]

  VkImagePlaneMemoryRequirementsInfo = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkImageAspectFlagBits  planeAspect"]

  VkImagePlaneMemoryRequirementsInfoKHR = VkImagePlaneMemoryRequirementsInfo

  VkImageResolve = struct [{ "srcSubresource" => VkImageSubresourceLayers },
                           { "srcOffset" => VkOffset3D },
                           { "dstSubresource" => VkImageSubresourceLayers },
                           { "dstOffset" => VkOffset3D },
                           { "extent" => VkExtent3D }]

  VkImageSparseMemoryRequirementsInfo2 = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkImage  image"]

  VkImageSparseMemoryRequirementsInfo2KHR = VkImageSparseMemoryRequirementsInfo2

  VkImageSwapchainCreateInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkSwapchainKHR  swapchain"]

  VkImageViewASTCDecodeModeEXT = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkFormat  decodeMode"]

  VkImageViewCreateInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkImageViewCreateFlags  flags",
                                  "VkImage  image",
                                  "VkImageViewType  viewType",
                                  "VkFormat  format",
                                  { "components" => VkComponentMapping },
                                  { "subresourceRange" => VkImageSubresourceRange }]

  VkImageViewUsageCreateInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkImageUsageFlags  usage"]

  VkImageViewUsageCreateInfoKHR = VkImageViewUsageCreateInfo

  VkImportAndroidHardwareBufferInfoANDROID = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "AHardwareBuffer * buffer"]

  VkImportFenceFdInfoKHR = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkFence  fence",
                                   "VkFenceImportFlags  flags",
                                   "VkExternalFenceHandleTypeFlagBits  handleType",
                                   "int  fd"]

  VkImportFenceWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkFence  fence",
                                            "VkFenceImportFlags  flags",
                                            "VkExternalFenceHandleTypeFlagBits  handleType",
                                            "HANDLE  handle",
                                            "LPCWSTR  name"]

  VkImportMemoryFdInfoKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkExternalMemoryHandleTypeFlagBits  handleType",
                                    "int  fd"]

  VkImportMemoryHostPointerInfoEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkExternalMemoryHandleTypeFlagBits  handleType",
                                             "void * pHostPointer"]

  VkImportMemoryWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkExternalMemoryHandleTypeFlagBits  handleType",
                                             "HANDLE  handle",
                                             "LPCWSTR  name"]

  VkImportMemoryWin32HandleInfoNV = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkExternalMemoryHandleTypeFlagsNV  handleType",
                                            "HANDLE  handle"]

  VkImportSemaphoreFdInfoKHR = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkSemaphore  semaphore",
                                       "VkSemaphoreImportFlags  flags",
                                       "VkExternalSemaphoreHandleTypeFlagBits  handleType",
                                       "int  fd"]

  VkImportSemaphoreWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkSemaphore  semaphore",
                                                "VkSemaphoreImportFlags  flags",
                                                "VkExternalSemaphoreHandleTypeFlagBits  handleType",
                                                "HANDLE  handle",
                                                "LPCWSTR  name"]

  VkIndirectCommandsLayoutTokenNVX = struct ["VkIndirectCommandsTokenTypeNVX  tokenType",
                                             "uint32_t  bindingUnit",
                                             "uint32_t  dynamicCount",
                                             "uint32_t  divisor"]
  VkIndirectCommandsLayoutCreateInfoNVX = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkPipelineBindPoint  pipelineBindPoint",
                                                  "VkIndirectCommandsLayoutUsageFlagsNVX  flags",
                                                  "uint32_t  tokenCount",
                                                  "VkIndirectCommandsLayoutTokenNVX * pTokens"]

  VkInputAttachmentAspectReference = struct ["uint32_t  subpass",
                                             "uint32_t  inputAttachmentIndex",
                                             "VkImageAspectFlags  aspectMask"]

  VkInputAttachmentAspectReferenceKHR = VkInputAttachmentAspectReference

  VkInstanceCreateInfo = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkInstanceCreateFlags  flags",
                                 "VkApplicationInfo * pApplicationInfo",
                                 "uint32_t  enabledLayerCount",
                                 "char * ppEnabledLayerNames",
                                 "uint32_t  enabledExtensionCount",
                                 "char * ppEnabledExtensionNames"]

  VkLayerProperties = struct ["char  layerName[#{VK_MAX_EXTENSION_NAME_SIZE}]",
                              "uint32_t  specVersion",
                              "uint32_t  implementationVersion",
                              "char  description[#{VK_MAX_DESCRIPTION_SIZE}]"]

  VkMacOSSurfaceCreateInfoMVK = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkMacOSSurfaceCreateFlagsMVK  flags",
                                        "void * pView"]

  VkMappedMemoryRange = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkDeviceMemory  memory",
                                "VkDeviceSize  offset",
                                "VkDeviceSize  size"]

  VkMemoryAllocateFlagsInfo = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkMemoryAllocateFlags  flags",
                                      "uint32_t  deviceMask"]

  VkMemoryAllocateFlagsInfoKHR = VkMemoryAllocateFlagsInfo

  VkMemoryAllocateInfo = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkDeviceSize  allocationSize",
                                 "uint32_t  memoryTypeIndex"]

  VkMemoryBarrier = struct ["VkStructureType  sType",
                            "void * pNext",
                            "VkAccessFlags  srcAccessMask",
                            "VkAccessFlags  dstAccessMask"]

  VkMemoryDedicatedAllocateInfo = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkImage  image",
                                          "VkBuffer  buffer"]

  VkMemoryDedicatedAllocateInfoKHR = VkMemoryDedicatedAllocateInfo

  VkMemoryDedicatedRequirements = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkBool32  prefersDedicatedAllocation",
                                          "VkBool32  requiresDedicatedAllocation"]

  VkMemoryDedicatedRequirementsKHR = VkMemoryDedicatedRequirements

  VkMemoryFdPropertiesKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "uint32_t  memoryTypeBits"]

  VkMemoryGetAndroidHardwareBufferInfoANDROID = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkDeviceMemory  memory"]

  VkMemoryGetFdInfoKHR = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkDeviceMemory  memory",
                                 "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkMemoryGetWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkDeviceMemory  memory",
                                          "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkMemoryHeap = struct ["VkDeviceSize  size",
                         "VkMemoryHeapFlags  flags"]

  VkMemoryHostPointerPropertiesEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  memoryTypeBits"]

  VkMemoryRequirements = struct ["VkDeviceSize  size",
                                 "VkDeviceSize  alignment",
                                 "uint32_t  memoryTypeBits"]

  VkMemoryRequirements2 = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  { "memoryRequirements" => VkMemoryRequirements }]

  VkMemoryRequirements2KHR = VkMemoryRequirements2

  VkMemoryType = struct ["VkMemoryPropertyFlags  propertyFlags",
                         "uint32_t  heapIndex"]

  VkMemoryWin32HandlePropertiesKHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  memoryTypeBits"]

  VkMultisamplePropertiesEXT = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       { "maxSampleLocationGridSize" => VkExtent2D }]

  VkNativeBufferANDROID = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "void * handle",
                                  "int  stride",
                                  "int  format",
                                  "int  usage"]

  VkObjectTableCreateInfoNVX = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "uint32_t  objectCount",
                                       "VkObjectEntryTypeNVX * pObjectEntryTypes",
                                       "uint32_t * pObjectEntryCounts",
                                       "VkObjectEntryUsageFlagsNVX * pObjectEntryUsageFlags",
                                       "uint32_t  maxUniformBuffersPerDescriptor",
                                       "uint32_t  maxStorageBuffersPerDescriptor",
                                       "uint32_t  maxStorageImagesPerDescriptor",
                                       "uint32_t  maxSampledImagesPerDescriptor",
                                       "uint32_t  maxPipelineLayouts"]

  VkObjectTableDescriptorSetEntryNVX = struct ["VkObjectEntryTypeNVX  type",
                                               "VkObjectEntryUsageFlagsNVX  flags",
                                               "VkPipelineLayout  pipelineLayout",
                                               "VkDescriptorSet  descriptorSet"]

  VkObjectTableEntryNVX = struct ["VkObjectEntryTypeNVX  type",
                                  "VkObjectEntryUsageFlagsNVX  flags"]

  VkObjectTableIndexBufferEntryNVX = struct ["VkObjectEntryTypeNVX  type",
                                             "VkObjectEntryUsageFlagsNVX  flags",
                                             "VkBuffer  buffer",
                                             "VkIndexType  indexType"]

  VkObjectTablePipelineEntryNVX = struct ["VkObjectEntryTypeNVX  type",
                                          "VkObjectEntryUsageFlagsNVX  flags",
                                          "VkPipeline  pipeline"]

  VkObjectTablePushConstantEntryNVX = struct ["VkObjectEntryTypeNVX  type",
                                              "VkObjectEntryUsageFlagsNVX  flags",
                                              "VkPipelineLayout  pipelineLayout",
                                              "VkShaderStageFlags  stageFlags"]

  VkObjectTableVertexBufferEntryNVX = struct ["VkObjectEntryTypeNVX  type",
                                              "VkObjectEntryUsageFlagsNVX  flags",
                                              "VkBuffer  buffer"]

  VkPastPresentationTimingGOOGLE = struct ["uint32_t  presentID",
                                           "uint64_t  desiredPresentTime",
                                           "uint64_t  actualPresentTime",
                                           "uint64_t  earliestPresentTime",
                                           "uint64_t  presentMargin"]

  VkPhysicalDevice16BitStorageFeatures = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkBool32  storageBuffer16BitAccess",
                                                 "VkBool32  uniformAndStorageBuffer16BitAccess",
                                                 "VkBool32  storagePushConstant16",
                                                 "VkBool32  storageInputOutput16"]

  VkPhysicalDevice16BitStorageFeaturesKHR = VkPhysicalDevice16BitStorageFeatures

  VkPhysicalDevice8BitStorageFeaturesKHR = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkBool32  storageBuffer8BitAccess",
                                                   "VkBool32  uniformAndStorageBuffer8BitAccess",
                                                   "VkBool32  storagePushConstant8"]

  VkPhysicalDeviceASTCDecodeFeaturesEXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkBool32  decodeModeSharedExponent"]

  VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkBool32  advancedBlendCoherentOperations"]

  VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "uint32_t  advancedBlendMaxColorAttachments",
                                                                "VkBool32  advancedBlendIndependentBlend",
                                                                "VkBool32  advancedBlendNonPremultipliedSrcColor",
                                                                "VkBool32  advancedBlendNonPremultipliedDstColor",
                                                                "VkBool32  advancedBlendCorrelatedOverlap",
                                                                "VkBool32  advancedBlendAllOperations"]

  VkPhysicalDeviceComputeShaderDerivativesFeaturesNV = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "VkBool32  computeDerivativeGroupQuads",
                                                               "VkBool32  computeDerivativeGroupLinear"]

  VkPhysicalDeviceConditionalRenderingFeaturesEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  conditionalRendering",
                                                            "VkBool32  inheritedConditionalRendering"]

  VkPhysicalDeviceConservativeRasterizationPropertiesEXT = struct ["VkStructureType  sType",
                                                                   "void * pNext",
                                                                   "float  primitiveOverestimationSize",
                                                                   "float  maxExtraPrimitiveOverestimationSize",
                                                                   "float  extraPrimitiveOverestimationSizeGranularity",
                                                                   "VkBool32  primitiveUnderestimation",
                                                                   "VkBool32  conservativePointAndLineRasterization",
                                                                   "VkBool32  degenerateTrianglesRasterized",
                                                                   "VkBool32  degenerateLinesRasterized",
                                                                   "VkBool32  fullyCoveredFragmentShaderInputVariable",
                                                                   "VkBool32  conservativeRasterizationPostDepthCoverage"]

  VkPhysicalDeviceCornerSampledImageFeaturesNV = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  cornerSampledImage"]

  VkPhysicalDeviceDescriptorIndexingFeaturesEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  shaderInputAttachmentArrayDynamicIndexing",
                                                          "VkBool32  shaderUniformTexelBufferArrayDynamicIndexing",
                                                          "VkBool32  shaderStorageTexelBufferArrayDynamicIndexing",
                                                          "VkBool32  shaderUniformBufferArrayNonUniformIndexing",
                                                          "VkBool32  shaderSampledImageArrayNonUniformIndexing",
                                                          "VkBool32  shaderStorageBufferArrayNonUniformIndexing",
                                                          "VkBool32  shaderStorageImageArrayNonUniformIndexing",
                                                          "VkBool32  shaderInputAttachmentArrayNonUniformIndexing",
                                                          "VkBool32  shaderUniformTexelBufferArrayNonUniformIndexing",
                                                          "VkBool32  shaderStorageTexelBufferArrayNonUniformIndexing",
                                                          "VkBool32  descriptorBindingUniformBufferUpdateAfterBind",
                                                          "VkBool32  descriptorBindingSampledImageUpdateAfterBind",
                                                          "VkBool32  descriptorBindingStorageImageUpdateAfterBind",
                                                          "VkBool32  descriptorBindingStorageBufferUpdateAfterBind",
                                                          "VkBool32  descriptorBindingUniformTexelBufferUpdateAfterBind",
                                                          "VkBool32  descriptorBindingStorageTexelBufferUpdateAfterBind",
                                                          "VkBool32  descriptorBindingUpdateUnusedWhilePending",
                                                          "VkBool32  descriptorBindingPartiallyBound",
                                                          "VkBool32  descriptorBindingVariableDescriptorCount",
                                                          "VkBool32  runtimeDescriptorArray"]

  VkPhysicalDeviceDescriptorIndexingPropertiesEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "uint32_t  maxUpdateAfterBindDescriptorsInAllPools",
                                                            "VkBool32  shaderUniformBufferArrayNonUniformIndexingNative",
                                                            "VkBool32  shaderSampledImageArrayNonUniformIndexingNative",
                                                            "VkBool32  shaderStorageBufferArrayNonUniformIndexingNative",
                                                            "VkBool32  shaderStorageImageArrayNonUniformIndexingNative",
                                                            "VkBool32  shaderInputAttachmentArrayNonUniformIndexingNative",
                                                            "VkBool32  robustBufferAccessUpdateAfterBind",
                                                            "VkBool32  quadDivergentImplicitLod",
                                                            "uint32_t  maxPerStageDescriptorUpdateAfterBindSamplers",
                                                            "uint32_t  maxPerStageDescriptorUpdateAfterBindUniformBuffers",
                                                            "uint32_t  maxPerStageDescriptorUpdateAfterBindStorageBuffers",
                                                            "uint32_t  maxPerStageDescriptorUpdateAfterBindSampledImages",
                                                            "uint32_t  maxPerStageDescriptorUpdateAfterBindStorageImages",
                                                            "uint32_t  maxPerStageDescriptorUpdateAfterBindInputAttachments",
                                                            "uint32_t  maxPerStageUpdateAfterBindResources",
                                                            "uint32_t  maxDescriptorSetUpdateAfterBindSamplers",
                                                            "uint32_t  maxDescriptorSetUpdateAfterBindUniformBuffers",
                                                            "uint32_t  maxDescriptorSetUpdateAfterBindUniformBuffersDynamic",
                                                            "uint32_t  maxDescriptorSetUpdateAfterBindStorageBuffers",
                                                            "uint32_t  maxDescriptorSetUpdateAfterBindStorageBuffersDynamic",
                                                            "uint32_t  maxDescriptorSetUpdateAfterBindSampledImages",
                                                            "uint32_t  maxDescriptorSetUpdateAfterBindStorageImages",
                                                            "uint32_t  maxDescriptorSetUpdateAfterBindInputAttachments"]

  VkPhysicalDeviceDiscardRectanglePropertiesEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "uint32_t  maxDiscardRectangles"]

  VkPhysicalDeviceDriverPropertiesKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkDriverIdKHR  driverID",
                                                "char  driverName[#{VK_MAX_DRIVER_NAME_SIZE_KHR}]",
                                                "char  driverInfo[#{VK_MAX_DRIVER_INFO_SIZE_KHR}]",
                                                { "conformanceVersion" => VkConformanceVersionKHR }]

  VkPhysicalDeviceExclusiveScissorFeaturesNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  exclusiveScissor"]

  VkPhysicalDeviceExternalBufferInfo = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkBufferCreateFlags  flags",
                                               "VkBufferUsageFlags  usage",
                                               "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkPhysicalDeviceExternalBufferInfoKHR = VkPhysicalDeviceExternalBufferInfo

  VkPhysicalDeviceExternalFenceInfo = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkExternalFenceHandleTypeFlagBits  handleType"]

  VkPhysicalDeviceExternalFenceInfoKHR = VkPhysicalDeviceExternalFenceInfo

  VkPhysicalDeviceExternalImageFormatInfo = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkPhysicalDeviceExternalImageFormatInfoKHR = VkPhysicalDeviceExternalImageFormatInfo

  VkPhysicalDeviceExternalMemoryHostPropertiesEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkDeviceSize  minImportedHostPointerAlignment"]

  VkPhysicalDeviceExternalSemaphoreInfo = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkExternalSemaphoreHandleTypeFlagBits  handleType"]

  VkPhysicalDeviceExternalSemaphoreInfoKHR = VkPhysicalDeviceExternalSemaphoreInfo

  VkPhysicalDeviceFeatures2 = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      { "features" => VkPhysicalDeviceFeatures }]

  VkPhysicalDeviceFeatures2KHR = VkPhysicalDeviceFeatures2

  VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "VkBool32  fragmentShaderBarycentric"]

  VkPhysicalDeviceGroupProperties = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "uint32_t  physicalDeviceCount",
                                            "VkPhysicalDevice  physicalDevices[#{VK_MAX_DEVICE_GROUP_SIZE}]",
                                            "VkBool32  subsetAllocation"]

  VkPhysicalDeviceGroupPropertiesKHR = VkPhysicalDeviceGroupProperties

  VkPhysicalDeviceIDProperties = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "uint8_t  deviceUUID[#{VK_UUID_SIZE}]",
                                         "uint8_t  driverUUID[#{VK_UUID_SIZE}]",
                                         "uint8_t  deviceLUID[#{VK_LUID_SIZE}]",
                                         "uint32_t  deviceNodeMask",
                                         "VkBool32  deviceLUIDValid"]

  VkPhysicalDeviceIDPropertiesKHR = VkPhysicalDeviceIDProperties

  VkPhysicalDeviceImageDrmFormatModifierInfoEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "uint64_t  drmFormatModifier",
                                                          "VkSharingMode  sharingMode",
                                                          "uint32_t  queueFamilyIndexCount",
                                                          "uint32_t * pQueueFamilyIndices"]

  VkPhysicalDeviceImageFormatInfo2 = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkFormat  format",
                                             "VkImageType  type",
                                             "VkImageTiling  tiling",
                                             "VkImageUsageFlags  usage",
                                             "VkImageCreateFlags  flags"]

  VkPhysicalDeviceImageFormatInfo2KHR = VkPhysicalDeviceImageFormatInfo2

  VkPhysicalDeviceInlineUniformBlockFeaturesEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  inlineUniformBlock",
                                                          "VkBool32  descriptorBindingInlineUniformBlockUpdateAfterBind"]

  VkPhysicalDeviceInlineUniformBlockPropertiesEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "uint32_t  maxInlineUniformBlockSize",
                                                            "uint32_t  maxPerStageDescriptorInlineUniformBlocks",
                                                            "uint32_t  maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks",
                                                            "uint32_t  maxDescriptorSetInlineUniformBlocks",
                                                            "uint32_t  maxDescriptorSetUpdateAfterBindInlineUniformBlocks"]

  VkPhysicalDeviceLimits = struct ["uint32_t  maxImageDimension1D",
                                   "uint32_t  maxImageDimension2D",
                                   "uint32_t  maxImageDimension3D",
                                   "uint32_t  maxImageDimensionCube",
                                   "uint32_t  maxImageArrayLayers",
                                   "uint32_t  maxTexelBufferElements",
                                   "uint32_t  maxUniformBufferRange",
                                   "uint32_t  maxStorageBufferRange",
                                   "uint32_t  maxPushConstantsSize",
                                   "uint32_t  maxMemoryAllocationCount",
                                   "uint32_t  maxSamplerAllocationCount",
                                   "VkDeviceSize  bufferImageGranularity",
                                   "VkDeviceSize  sparseAddressSpaceSize",
                                   "uint32_t  maxBoundDescriptorSets",
                                   "uint32_t  maxPerStageDescriptorSamplers",
                                   "uint32_t  maxPerStageDescriptorUniformBuffers",
                                   "uint32_t  maxPerStageDescriptorStorageBuffers",
                                   "uint32_t  maxPerStageDescriptorSampledImages",
                                   "uint32_t  maxPerStageDescriptorStorageImages",
                                   "uint32_t  maxPerStageDescriptorInputAttachments",
                                   "uint32_t  maxPerStageResources",
                                   "uint32_t  maxDescriptorSetSamplers",
                                   "uint32_t  maxDescriptorSetUniformBuffers",
                                   "uint32_t  maxDescriptorSetUniformBuffersDynamic",
                                   "uint32_t  maxDescriptorSetStorageBuffers",
                                   "uint32_t  maxDescriptorSetStorageBuffersDynamic",
                                   "uint32_t  maxDescriptorSetSampledImages",
                                   "uint32_t  maxDescriptorSetStorageImages",
                                   "uint32_t  maxDescriptorSetInputAttachments",
                                   "uint32_t  maxVertexInputAttributes",
                                   "uint32_t  maxVertexInputBindings",
                                   "uint32_t  maxVertexInputAttributeOffset",
                                   "uint32_t  maxVertexInputBindingStride",
                                   "uint32_t  maxVertexOutputComponents",
                                   "uint32_t  maxTessellationGenerationLevel",
                                   "uint32_t  maxTessellationPatchSize",
                                   "uint32_t  maxTessellationControlPerVertexInputComponents",
                                   "uint32_t  maxTessellationControlPerVertexOutputComponents",
                                   "uint32_t  maxTessellationControlPerPatchOutputComponents",
                                   "uint32_t  maxTessellationControlTotalOutputComponents",
                                   "uint32_t  maxTessellationEvaluationInputComponents",
                                   "uint32_t  maxTessellationEvaluationOutputComponents",
                                   "uint32_t  maxGeometryShaderInvocations",
                                   "uint32_t  maxGeometryInputComponents",
                                   "uint32_t  maxGeometryOutputComponents",
                                   "uint32_t  maxGeometryOutputVertices",
                                   "uint32_t  maxGeometryTotalOutputComponents",
                                   "uint32_t  maxFragmentInputComponents",
                                   "uint32_t  maxFragmentOutputAttachments",
                                   "uint32_t  maxFragmentDualSrcAttachments",
                                   "uint32_t  maxFragmentCombinedOutputResources",
                                   "uint32_t  maxComputeSharedMemorySize",
                                   "uint32_t  maxComputeWorkGroupCount [3]",
                                   "uint32_t  maxComputeWorkGroupInvocations",
                                   "uint32_t  maxComputeWorkGroupSize [3]",
                                   "uint32_t  subPixelPrecisionBits",
                                   "uint32_t  subTexelPrecisionBits",
                                   "uint32_t  mipmapPrecisionBits",
                                   "uint32_t  maxDrawIndexedIndexValue",
                                   "uint32_t  maxDrawIndirectCount",
                                   "float  maxSamplerLodBias",
                                   "float  maxSamplerAnisotropy",
                                   "uint32_t  maxViewports",
                                   "uint32_t  maxViewportDimensions [2]",
                                   "float  viewportBoundsRange [2]",
                                   "uint32_t  viewportSubPixelBits",
                                   "size_t  minMemoryMapAlignment",
                                   "VkDeviceSize  minTexelBufferOffsetAlignment",
                                   "VkDeviceSize  minUniformBufferOffsetAlignment",
                                   "VkDeviceSize  minStorageBufferOffsetAlignment",
                                   "int32_t  minTexelOffset",
                                   "uint32_t  maxTexelOffset",
                                   "int32_t  minTexelGatherOffset",
                                   "uint32_t  maxTexelGatherOffset",
                                   "float  minInterpolationOffset",
                                   "float  maxInterpolationOffset",
                                   "uint32_t  subPixelInterpolationOffsetBits",
                                   "uint32_t  maxFramebufferWidth",
                                   "uint32_t  maxFramebufferHeight",
                                   "uint32_t  maxFramebufferLayers",
                                   "VkSampleCountFlags  framebufferColorSampleCounts",
                                   "VkSampleCountFlags  framebufferDepthSampleCounts",
                                   "VkSampleCountFlags  framebufferStencilSampleCounts",
                                   "VkSampleCountFlags  framebufferNoAttachmentsSampleCounts",
                                   "uint32_t  maxColorAttachments",
                                   "VkSampleCountFlags  sampledImageColorSampleCounts",
                                   "VkSampleCountFlags  sampledImageIntegerSampleCounts",
                                   "VkSampleCountFlags  sampledImageDepthSampleCounts",
                                   "VkSampleCountFlags  sampledImageStencilSampleCounts",
                                   "VkSampleCountFlags  storageImageSampleCounts",
                                   "uint32_t  maxSampleMaskWords",
                                   "VkBool32  timestampComputeAndGraphics",
                                   "float  timestampPeriod",
                                   "uint32_t  maxClipDistances",
                                   "uint32_t  maxCullDistances",
                                   "uint32_t  maxCombinedClipAndCullDistances",
                                   "uint32_t  discreteQueuePriorities",
                                   "float  pointSizeRange [2]",
                                   "float  lineWidthRange [2]",
                                   "float  pointSizeGranularity",
                                   "float  lineWidthGranularity",
                                   "VkBool32  strictLines",
                                   "VkBool32  standardSampleLocations",
                                   "VkDeviceSize  optimalBufferCopyOffsetAlignment",
                                   "VkDeviceSize  optimalBufferCopyRowPitchAlignment",
                                   "VkDeviceSize  nonCoherentAtomSize"]

  VkPhysicalDeviceMaintenance3Properties = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  maxPerSetDescriptors",
                                                   "VkDeviceSize  maxMemoryAllocationSize"]

  VkPhysicalDeviceMaintenance3PropertiesKHR = VkPhysicalDeviceMaintenance3Properties

  VkPhysicalDeviceMemoryProperties = struct ["uint32_t  memoryTypeCount",
                                             { "memoryTypes[#{VK_MAX_MEMORY_TYPES}]" => VkMemoryType },
                                             "uint32_t  memoryHeapCount",
                                             { "memoryHeaps[#{VK_MAX_MEMORY_HEAPS}]" => VkMemoryHeap }]

  VkPhysicalDeviceMemoryProperties2 = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              { "memoryProperties" => VkPhysicalDeviceMemoryProperties }]

  VkPhysicalDeviceMemoryProperties2KHR = VkPhysicalDeviceMemoryProperties2

  VkPhysicalDeviceMeshShaderFeaturesNV = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkBool32  taskShader",
                                                 "VkBool32  meshShader"]

  VkPhysicalDeviceMeshShaderPropertiesNV = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  maxDrawMeshTasksCount",
                                                   "uint32_t  maxTaskWorkGroupInvocations",
                                                   "uint32_t  maxTaskWorkGroupSize [3]",
                                                   "uint32_t  maxTaskTotalMemorySize",
                                                   "uint32_t  maxTaskOutputCount",
                                                   "uint32_t  maxMeshWorkGroupInvocations",
                                                   "uint32_t  maxMeshWorkGroupSize [3]",
                                                   "uint32_t  maxMeshTotalMemorySize",
                                                   "uint32_t  maxMeshOutputVertices",
                                                   "uint32_t  maxMeshOutputPrimitives",
                                                   "uint32_t  maxMeshMultiviewViewCount",
                                                   "uint32_t  meshOutputPerVertexGranularity",
                                                   "uint32_t  meshOutputPerPrimitiveGranularity"]

  VkPhysicalDeviceMultiviewFeatures = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkBool32  multiview",
                                              "VkBool32  multiviewGeometryShader",
                                              "VkBool32  multiviewTessellationShader"]

  VkPhysicalDeviceMultiviewFeaturesKHR = VkPhysicalDeviceMultiviewFeatures

  VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX = struct ["VkStructureType  sType",
                                                                    "void * pNext",
                                                                    "VkBool32  perViewPositionAllComponents"]

  VkPhysicalDeviceMultiviewProperties = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  maxMultiviewViewCount",
                                                "uint32_t  maxMultiviewInstanceIndex"]

  VkPhysicalDeviceMultiviewPropertiesKHR = VkPhysicalDeviceMultiviewProperties

  VkPhysicalDevicePCIBusInfoPropertiesEXT = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "uint16_t  pciDomain",
                                                    "uint8_t  pciBus",
                                                    "uint8_t  pciDevice",
                                                    "uint8_t  pciFunction"]

  VkPhysicalDevicePointClippingProperties = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkPointClippingBehavior  pointClippingBehavior"]

  VkPhysicalDevicePointClippingPropertiesKHR = VkPhysicalDevicePointClippingProperties

  VkPhysicalDeviceSparseProperties = struct ["VkBool32  residencyStandard2DBlockShape",
                                             "VkBool32  residencyStandard2DMultisampleBlockShape",
                                             "VkBool32  residencyStandard3DBlockShape",
                                             "VkBool32  residencyAlignedMipSize",
                                             "VkBool32  residencyNonResidentStrict"]
  VkPhysicalDeviceProperties = struct ["uint32_t  apiVersion",
                                       "uint32_t  driverVersion",
                                       "uint32_t  vendorID",
                                       "uint32_t  deviceID",
                                       "VkPhysicalDeviceType  deviceType",
                                       "char  deviceName[#{VK_MAX_PHYSICAL_DEVICE_NAME_SIZE}]",
                                       "uint8_t  pipelineCacheUUID[#{VK_UUID_SIZE}]",
                                       { "limits" => VkPhysicalDeviceLimits },
                                       { "sparseProperties" => VkPhysicalDeviceSparseProperties }]

  VkPhysicalDeviceProperties2 = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        { "properties" => VkPhysicalDeviceProperties }]

  VkPhysicalDeviceProperties2KHR = VkPhysicalDeviceProperties2

  VkPhysicalDeviceProtectedMemoryFeatures = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkBool32  protectedMemory"]

  VkPhysicalDeviceProtectedMemoryProperties = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  protectedNoFault"]

  VkPhysicalDevicePushDescriptorPropertiesKHR = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "uint32_t  maxPushDescriptors"]

  VkPhysicalDeviceRayTracingPropertiesNV = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  shaderGroupHandleSize",
                                                   "uint32_t  maxRecursionDepth",
                                                   "uint32_t  maxShaderGroupStride",
                                                   "uint32_t  shaderGroupBaseAlignment",
                                                   "uint64_t  maxGeometryCount",
                                                   "uint64_t  maxInstanceCount",
                                                   "uint64_t  maxTriangleCount",
                                                   "uint32_t  maxDescriptorSetAccelerationStructures"]

  VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 "VkBool32  representativeFragmentTest"]

  VkPhysicalDeviceSampleLocationsPropertiesEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkSampleCountFlags  sampleLocationSampleCounts",
                                                         { "maxSampleLocationGridSize" => VkExtent2D },
                                                         "float  sampleLocationCoordinateRange [2]",
                                                         "uint32_t  sampleLocationSubPixelBits",
                                                         "VkBool32  variableSampleLocations"]

  VkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT = struct ["VkStructureType  sType",
                                                             "void * pNext",
                                                             "VkBool32  filterMinmaxSingleComponentFormats",
                                                             "VkBool32  filterMinmaxImageComponentMapping"]

  VkPhysicalDeviceSamplerYcbcrConversionFeatures = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  samplerYcbcrConversion"]

  VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR = VkPhysicalDeviceSamplerYcbcrConversionFeatures

  VkPhysicalDeviceShaderAtomicInt64FeaturesKHR = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  shaderBufferInt64Atomics",
                                                         "VkBool32  shaderSharedInt64Atomics"]

  VkPhysicalDeviceShaderCorePropertiesAMD = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "uint32_t  shaderEngineCount",
                                                    "uint32_t  shaderArraysPerEngineCount",
                                                    "uint32_t  computeUnitsPerShaderArray",
                                                    "uint32_t  simdPerComputeUnit",
                                                    "uint32_t  wavefrontsPerSimd",
                                                    "uint32_t  wavefrontSize",
                                                    "uint32_t  sgprsPerSimd",
                                                    "uint32_t  minSgprAllocation",
                                                    "uint32_t  maxSgprAllocation",
                                                    "uint32_t  sgprAllocationGranularity",
                                                    "uint32_t  vgprsPerSimd",
                                                    "uint32_t  minVgprAllocation",
                                                    "uint32_t  maxVgprAllocation",
                                                    "uint32_t  vgprAllocationGranularity"]

  VkPhysicalDeviceShaderDrawParameterFeatures = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  shaderDrawParameters"]

  VkPhysicalDeviceShaderImageFootprintFeaturesNV = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  imageFootprint"]

  VkPhysicalDeviceShadingRateImageFeaturesNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  shadingRateImage",
                                                       "VkBool32  shadingRateCoarseSampleOrder"]

  VkPhysicalDeviceShadingRateImagePropertiesNV = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         { "shadingRateTexelSize" => VkExtent2D },
                                                         "uint32_t  shadingRatePaletteSize",
                                                         "uint32_t  shadingRateMaxCoarseSamples"]

  VkPhysicalDeviceSparseImageFormatInfo2 = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkFormat  format",
                                                   "VkImageType  type",
                                                   "VkSampleCountFlagBits  samples",
                                                   "VkImageUsageFlags  usage",
                                                   "VkImageTiling  tiling"]

  VkPhysicalDeviceSparseImageFormatInfo2KHR = VkPhysicalDeviceSparseImageFormatInfo2

  VkPhysicalDeviceSubgroupProperties = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "uint32_t  subgroupSize",
                                               "VkShaderStageFlags  supportedStages",
                                               "VkSubgroupFeatureFlags  supportedOperations",
                                               "VkBool32  quadOperationsInAllStages"]

  VkPhysicalDeviceSurfaceInfo2KHR = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkSurfaceKHR  surface"]

  VkPhysicalDeviceTransformFeedbackFeaturesEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  transformFeedback",
                                                         "VkBool32  geometryStreams"]

  VkPhysicalDeviceTransformFeedbackPropertiesEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "uint32_t  maxTransformFeedbackStreams",
                                                           "uint32_t  maxTransformFeedbackBuffers",
                                                           "VkDeviceSize  maxTransformFeedbackBufferSize",
                                                           "uint32_t  maxTransformFeedbackStreamDataSize",
                                                           "uint32_t  maxTransformFeedbackBufferDataSize",
                                                           "uint32_t  maxTransformFeedbackBufferDataStride",
                                                           "VkBool32  transformFeedbackQueries",
                                                           "VkBool32  transformFeedbackStreamsLinesTriangles",
                                                           "VkBool32  transformFeedbackRasterizationStreamSelect",
                                                           "VkBool32  transformFeedbackDraw"]

  VkPhysicalDeviceVariablePointerFeatures = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkBool32  variablePointersStorageBuffer",
                                                    "VkBool32  variablePointers"]

  VkPhysicalDeviceVariablePointerFeaturesKHR = VkPhysicalDeviceVariablePointerFeatures

  VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkBool32  vertexAttributeInstanceRateDivisor",
                                                              "VkBool32  vertexAttributeInstanceRateZeroDivisor"]

  VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "uint32_t  maxVertexAttribDivisor"]

  VkPhysicalDeviceVulkanMemoryModelFeaturesKHR = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  vulkanMemoryModel",
                                                         "VkBool32  vulkanMemoryModelDeviceScope"]

  VkPipelineCacheCreateInfo = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkPipelineCacheCreateFlags  flags",
                                      "size_t  initialDataSize",
                                      "void * pInitialData"]

  VkPipelineColorBlendAdvancedStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  srcPremultiplied",
                                                           "VkBool32  dstPremultiplied",
                                                           "VkBlendOverlapEXT  blendOverlap"]

  VkPipelineCoverageModulationStateCreateInfoNV = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkPipelineCoverageModulationStateCreateFlagsNV  flags",
                                                          "VkCoverageModulationModeNV  coverageModulationMode",
                                                          "VkBool32  coverageModulationTableEnable",
                                                          "uint32_t  coverageModulationTableCount",
                                                          "float * pCoverageModulationTable"]

  VkPipelineCoverageToColorStateCreateInfoNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkPipelineCoverageToColorStateCreateFlagsNV  flags",
                                                       "VkBool32  coverageToColorEnable",
                                                       "uint32_t  coverageToColorLocation"]

  VkPipelineDiscardRectangleStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkPipelineDiscardRectangleStateCreateFlagsEXT  flags",
                                                         "VkDiscardRectangleModeEXT  discardRectangleMode",
                                                         "uint32_t  discardRectangleCount",
                                                         "VkRect2D * pDiscardRectangles"]

  VkPushConstantRange = struct ["VkShaderStageFlags  stageFlags",
                                "uint32_t  offset",
                                "uint32_t  size"]
  VkPipelineLayoutCreateInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkPipelineLayoutCreateFlags  flags",
                                       "uint32_t  setLayoutCount",
                                       "VkDescriptorSetLayout * pSetLayouts",
                                       "uint32_t  pushConstantRangeCount",
                                       "VkPushConstantRange * pPushConstantRanges"]

  VkPipelineRasterizationConservativeStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "VkPipelineRasterizationConservativeStateCreateFlagsEXT  flags",
                                                                  "VkConservativeRasterizationModeEXT  conservativeRasterizationMode",
                                                                  "float  extraPrimitiveOverestimationSize"]

  VkPipelineRasterizationStateRasterizationOrderAMD = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkRasterizationOrderAMD  rasterizationOrder"]

  VkPipelineRasterizationStateStreamCreateInfoEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkPipelineRasterizationStateStreamCreateFlagsEXT  flags",
                                                            "uint32_t  rasterizationStream"]

  VkPipelineRepresentativeFragmentTestStateCreateInfoNV = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "VkBool32  representativeFragmentTestEnable"]

  VkPipelineSampleLocationsStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  sampleLocationsEnable",
                                                        { "sampleLocationsInfo" => VkSampleLocationsInfoEXT }]

  VkPipelineTessellationDomainOriginStateCreateInfo = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkTessellationDomainOrigin  domainOrigin"]

  VkPipelineTessellationDomainOriginStateCreateInfoKHR = VkPipelineTessellationDomainOriginStateCreateInfo

  VkVertexInputBindingDivisorDescriptionEXT = struct ["uint32_t  binding",
                                                      "uint32_t  divisor"]
  VkPipelineVertexInputDivisorStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "uint32_t  vertexBindingDivisorCount",
                                                           "VkVertexInputBindingDivisorDescriptionEXT * pVertexBindingDivisors"]

  VkPipelineViewportCoarseSampleOrderStateCreateInfoNV = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 "VkCoarseSampleOrderTypeNV  sampleOrderType",
                                                                 "uint32_t  customSampleOrderCount",
                                                                 "VkCoarseSampleOrderCustomNV * pCustomSampleOrders"]

  VkPipelineViewportExclusiveScissorStateCreateInfoNV = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "uint32_t  exclusiveScissorCount",
                                                                "VkRect2D * pExclusiveScissors"]

  VkShadingRatePaletteNV = struct ["uint32_t  shadingRatePaletteEntryCount",
                                   "VkShadingRatePaletteEntryNV * pShadingRatePaletteEntries"]
  VkPipelineViewportShadingRateImageStateCreateInfoNV = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "VkBool32  shadingRateImageEnable",
                                                                "uint32_t  viewportCount",
                                                                "VkShadingRatePaletteNV * pShadingRatePalettes"]

  VkViewportSwizzleNV = struct ["VkViewportCoordinateSwizzleNV  x",
                                "VkViewportCoordinateSwizzleNV  y",
                                "VkViewportCoordinateSwizzleNV  z",
                                "VkViewportCoordinateSwizzleNV  w"]
  VkPipelineViewportSwizzleStateCreateInfoNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkPipelineViewportSwizzleStateCreateFlagsNV  flags",
                                                       "uint32_t  viewportCount",
                                                       "VkViewportSwizzleNV * pViewportSwizzles"]

  VkViewportWScalingNV = struct ["float  xcoeff",
                                 "float  ycoeff"]
  VkPipelineViewportWScalingStateCreateInfoNV = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  viewportWScalingEnable",
                                                        "uint32_t  viewportCount",
                                                        "VkViewportWScalingNV * pViewportWScalings"]

  VkPresentInfoKHR = struct ["VkStructureType  sType",
                             "void * pNext",
                             "uint32_t  waitSemaphoreCount",
                             "VkSemaphore * pWaitSemaphores",
                             "uint32_t  swapchainCount",
                             "VkSwapchainKHR * pSwapchains",
                             "uint32_t * pImageIndices",
                             "VkResult * pResults"]

  VkRectLayerKHR = struct [{ "offset" => VkOffset2D },
                           { "extent" => VkExtent2D },
                           "uint32_t  layer"]
  VkPresentRegionKHR = struct ["uint32_t  rectangleCount",
                               "VkRectLayerKHR * pRectangles"]

  VkPresentRegionsKHR = struct ["VkStructureType  sType",
                                "void * pNext",
                                "uint32_t  swapchainCount",
                                "VkPresentRegionKHR * pRegions"]

  VkPresentTimeGOOGLE = struct ["uint32_t  presentID",
                                "uint64_t  desiredPresentTime"]

  VkPresentTimesInfoGOOGLE = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "uint32_t  swapchainCount",
                                     "VkPresentTimeGOOGLE * pTimes"]

  VkProtectedSubmitInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkBool32  protectedSubmit"]

  VkQueryPoolCreateInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkQueryPoolCreateFlags  flags",
                                  "VkQueryType  queryType",
                                  "uint32_t  queryCount",
                                  "VkQueryPipelineStatisticFlags  pipelineStatistics"]

  VkQueueFamilyCheckpointPropertiesNV = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkPipelineStageFlags  checkpointExecutionStageMask"]

  VkQueueFamilyProperties = struct ["VkQueueFlags  queueFlags",
                                    "uint32_t  queueCount",
                                    "uint32_t  timestampValidBits",
                                    { "minImageTransferGranularity" => VkExtent3D }]

  VkQueueFamilyProperties2 = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     { "queueFamilyProperties" => VkQueueFamilyProperties }]

  VkQueueFamilyProperties2KHR = VkQueueFamilyProperties2

  VkRayTracingShaderGroupCreateInfoNV = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkRayTracingShaderGroupTypeNV  type",
                                                "uint32_t  generalShader",
                                                "uint32_t  closestHitShader",
                                                "uint32_t  anyHitShader",
                                                "uint32_t  intersectionShader"]
  VkRayTracingPipelineCreateInfoNV = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkPipelineCreateFlags  flags",
                                             "uint32_t  stageCount",
                                             "VkPipelineShaderStageCreateInfo * pStages",
                                             "uint32_t  groupCount",
                                             "VkRayTracingShaderGroupCreateInfoNV * pGroups",
                                             "uint32_t  maxRecursionDepth",
                                             "VkPipelineLayout  layout",
                                             "VkPipeline  basePipelineHandle",
                                             "int32_t  basePipelineIndex"]

  VkRefreshCycleDurationGOOGLE = struct ["uint64_t  refreshDuration"]

  VkRenderPassBeginInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkRenderPass  renderPass",
                                  "VkFramebuffer  framebuffer",
                                  { "renderArea" => VkRect2D },
                                  "uint32_t  clearValueCount",
                                  "VkClearValue * pClearValues"]

  VkSubpassDescription = struct ["VkSubpassDescriptionFlags  flags",
                                 "VkPipelineBindPoint  pipelineBindPoint",
                                 "uint32_t  inputAttachmentCount",
                                 "VkAttachmentReference * pInputAttachments",
                                 "uint32_t  colorAttachmentCount",
                                 "VkAttachmentReference * pColorAttachments",
                                 "VkAttachmentReference * pResolveAttachments",
                                 "VkAttachmentReference * pDepthStencilAttachment",
                                 "uint32_t  preserveAttachmentCount",
                                 "uint32_t * pPreserveAttachments"]
  VkSubpassDependency = struct ["uint32_t  srcSubpass",
                                "uint32_t  dstSubpass",
                                "VkPipelineStageFlags  srcStageMask",
                                "VkPipelineStageFlags  dstStageMask",
                                "VkAccessFlags  srcAccessMask",
                                "VkAccessFlags  dstAccessMask",
                                "VkDependencyFlags  dependencyFlags"]
  VkRenderPassCreateInfo = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkRenderPassCreateFlags  flags",
                                   "uint32_t  attachmentCount",
                                   "VkAttachmentDescription * pAttachments",
                                   "uint32_t  subpassCount",
                                   "VkSubpassDescription * pSubpasses",
                                   "uint32_t  dependencyCount",
                                   "VkSubpassDependency * pDependencies"]

  VkSubpassDescription2KHR = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkSubpassDescriptionFlags  flags",
                                     "VkPipelineBindPoint  pipelineBindPoint",
                                     "uint32_t  viewMask",
                                     "uint32_t  inputAttachmentCount",
                                     "VkAttachmentReference2KHR * pInputAttachments",
                                     "uint32_t  colorAttachmentCount",
                                     "VkAttachmentReference2KHR * pColorAttachments",
                                     "VkAttachmentReference2KHR * pResolveAttachments",
                                     "VkAttachmentReference2KHR * pDepthStencilAttachment",
                                     "uint32_t  preserveAttachmentCount",
                                     "uint32_t * pPreserveAttachments"]
  VkSubpassDependency2KHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "uint32_t  srcSubpass",
                                    "uint32_t  dstSubpass",
                                    "VkPipelineStageFlags  srcStageMask",
                                    "VkPipelineStageFlags  dstStageMask",
                                    "VkAccessFlags  srcAccessMask",
                                    "VkAccessFlags  dstAccessMask",
                                    "VkDependencyFlags  dependencyFlags",
                                    "int32_t  viewOffset"]
  VkRenderPassCreateInfo2KHR = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkRenderPassCreateFlags  flags",
                                       "uint32_t  attachmentCount",
                                       "VkAttachmentDescription2KHR * pAttachments",
                                       "uint32_t  subpassCount",
                                       "VkSubpassDescription2KHR * pSubpasses",
                                       "uint32_t  dependencyCount",
                                       "VkSubpassDependency2KHR * pDependencies",
                                       "uint32_t  correlatedViewMaskCount",
                                       "uint32_t * pCorrelatedViewMasks"]

  VkRenderPassInputAttachmentAspectCreateInfo = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "uint32_t  aspectReferenceCount",
                                                        "VkInputAttachmentAspectReference * pAspectReferences"]

  VkRenderPassInputAttachmentAspectCreateInfoKHR = VkRenderPassInputAttachmentAspectCreateInfo

  VkRenderPassMultiviewCreateInfo = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "uint32_t  subpassCount",
                                            "uint32_t * pViewMasks",
                                            "uint32_t  dependencyCount",
                                            "int32_t * pViewOffsets",
                                            "uint32_t  correlationMaskCount",
                                            "uint32_t * pCorrelationMasks"]

  VkRenderPassMultiviewCreateInfoKHR = VkRenderPassMultiviewCreateInfo

  VkSubpassSampleLocationsEXT = struct ["uint32_t  subpassIndex",
                                        { "sampleLocationsInfo" => VkSampleLocationsInfoEXT }]
  VkRenderPassSampleLocationsBeginInfoEXT = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "uint32_t  attachmentInitialSampleLocationsCount",
                                                    "VkAttachmentSampleLocationsEXT * pAttachmentInitialSampleLocations",
                                                    "uint32_t  postSubpassSampleLocationsCount",
                                                    "VkSubpassSampleLocationsEXT * pPostSubpassSampleLocations"]

  VkSamplerCreateInfo = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkSamplerCreateFlags  flags",
                                "VkFilter  magFilter",
                                "VkFilter  minFilter",
                                "VkSamplerMipmapMode  mipmapMode",
                                "VkSamplerAddressMode  addressModeU",
                                "VkSamplerAddressMode  addressModeV",
                                "VkSamplerAddressMode  addressModeW",
                                "float  mipLodBias",
                                "VkBool32  anisotropyEnable",
                                "float  maxAnisotropy",
                                "VkBool32  compareEnable",
                                "VkCompareOp  compareOp",
                                "float  minLod",
                                "float  maxLod",
                                "VkBorderColor  borderColor",
                                "VkBool32  unnormalizedCoordinates"]

  VkSamplerReductionModeCreateInfoEXT = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkSamplerReductionModeEXT  reductionMode"]

  VkSamplerYcbcrConversionCreateInfo = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkFormat  format",
                                               "VkSamplerYcbcrModelConversion  ycbcrModel",
                                               "VkSamplerYcbcrRange  ycbcrRange",
                                               { "components" => VkComponentMapping },
                                               "VkChromaLocation  xChromaOffset",
                                               "VkChromaLocation  yChromaOffset",
                                               "VkFilter  chromaFilter",
                                               "VkBool32  forceExplicitReconstruction"]

  VkSamplerYcbcrConversionCreateInfoKHR = VkSamplerYcbcrConversionCreateInfo

  VkSamplerYcbcrConversionImageFormatProperties = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "uint32_t  combinedImageSamplerDescriptorCount"]

  VkSamplerYcbcrConversionImageFormatPropertiesKHR = VkSamplerYcbcrConversionImageFormatProperties

  VkSamplerYcbcrConversionInfo = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkSamplerYcbcrConversion  conversion"]

  VkSamplerYcbcrConversionInfoKHR = VkSamplerYcbcrConversionInfo

  VkSemaphoreCreateInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkSemaphoreCreateFlags  flags"]

  VkSemaphoreGetFdInfoKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkSemaphore  semaphore",
                                    "VkExternalSemaphoreHandleTypeFlagBits  handleType"]

  VkSemaphoreGetWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkSemaphore  semaphore",
                                             "VkExternalSemaphoreHandleTypeFlagBits  handleType"]

  VkShaderModuleCreateInfo = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkShaderModuleCreateFlags  flags",
                                     "size_t  codeSize",
                                     "uint32_t * pCode"]

  VkShaderModuleValidationCacheCreateInfoEXT = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkValidationCacheEXT  validationCache"]

  VkShaderResourceUsageAMD = struct ["uint32_t  numUsedVgprs",
                                     "uint32_t  numUsedSgprs",
                                     "uint32_t  ldsSizePerLocalWorkGroup",
                                     "size_t  ldsUsageSizeInBytes",
                                     "size_t  scratchMemUsageInBytes"]

  VkShaderStatisticsInfoAMD = struct ["VkShaderStageFlags  shaderStageMask",
                                      { "resourceUsage" => VkShaderResourceUsageAMD },
                                      "uint32_t  numPhysicalVgprs",
                                      "uint32_t  numPhysicalSgprs",
                                      "uint32_t  numAvailableVgprs",
                                      "uint32_t  numAvailableSgprs",
                                      "uint32_t  computeWorkGroupSize [3]"]

  VkSharedPresentSurfaceCapabilitiesKHR = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkImageUsageFlags  sharedPresentSupportedUsageFlags"]

  VkSparseImageFormatProperties = struct ["VkImageAspectFlags  aspectMask",
                                          { "imageGranularity" => VkExtent3D },
                                          "VkSparseImageFormatFlags  flags"]

  VkSparseImageFormatProperties2 = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           { "properties" => VkSparseImageFormatProperties }]

  VkSparseImageFormatProperties2KHR = VkSparseImageFormatProperties2

  VkSparseImageMemoryRequirements = struct [{ "formatProperties" => VkSparseImageFormatProperties },
                                            "uint32_t  imageMipTailFirstLod",
                                            "VkDeviceSize  imageMipTailSize",
                                            "VkDeviceSize  imageMipTailOffset",
                                            "VkDeviceSize  imageMipTailStride"]

  VkSparseImageMemoryRequirements2 = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             { "memoryRequirements" => VkSparseImageMemoryRequirements }]

  VkSparseImageMemoryRequirements2KHR = VkSparseImageMemoryRequirements2

  VkSubmitInfo = struct ["VkStructureType  sType",
                         "void * pNext",
                         "uint32_t  waitSemaphoreCount",
                         "VkSemaphore * pWaitSemaphores",
                         "VkPipelineStageFlags * pWaitDstStageMask",
                         "uint32_t  commandBufferCount",
                         "VkCommandBuffer * pCommandBuffers",
                         "uint32_t  signalSemaphoreCount",
                         "VkSemaphore * pSignalSemaphores"]

  VkSubpassBeginInfoKHR = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkSubpassContents  contents"]

  VkSubpassEndInfoKHR = struct ["VkStructureType  sType",
                                "void * pNext"]

  VkSurfaceCapabilities2EXT = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "uint32_t  minImageCount",
                                      "uint32_t  maxImageCount",
                                      { "currentExtent" => VkExtent2D },
                                      { "minImageExtent" => VkExtent2D },
                                      { "maxImageExtent" => VkExtent2D },
                                      "uint32_t  maxImageArrayLayers",
                                      "VkSurfaceTransformFlagsKHR  supportedTransforms",
                                      "VkSurfaceTransformFlagBitsKHR  currentTransform",
                                      "VkCompositeAlphaFlagsKHR  supportedCompositeAlpha",
                                      "VkImageUsageFlags  supportedUsageFlags",
                                      "VkSurfaceCounterFlagsEXT  supportedSurfaceCounters"]

  VkSurfaceCapabilitiesKHR = struct ["uint32_t  minImageCount",
                                     "uint32_t  maxImageCount",
                                     { "currentExtent" => VkExtent2D },
                                     { "minImageExtent" => VkExtent2D },
                                     { "maxImageExtent" => VkExtent2D },
                                     "uint32_t  maxImageArrayLayers",
                                     "VkSurfaceTransformFlagsKHR  supportedTransforms",
                                     "VkSurfaceTransformFlagBitsKHR  currentTransform",
                                     "VkCompositeAlphaFlagsKHR  supportedCompositeAlpha",
                                     "VkImageUsageFlags  supportedUsageFlags"]
  VkSurfaceCapabilities2KHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      { "surfaceCapabilities" => VkSurfaceCapabilitiesKHR }]

  VkSurfaceFormatKHR = struct ["VkFormat  format",
                               "VkColorSpaceKHR  colorSpace"]
  VkSurfaceFormat2KHR = struct ["VkStructureType  sType",
                                "void * pNext",
                                { "surfaceFormat" => VkSurfaceFormatKHR }]

  VkSwapchainCounterCreateInfoEXT = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkSurfaceCounterFlagsEXT  surfaceCounters"]

  VkSwapchainCreateInfoKHR = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkSwapchainCreateFlagsKHR  flags",
                                     "VkSurfaceKHR  surface",
                                     "uint32_t  minImageCount",
                                     "VkFormat  imageFormat",
                                     "VkColorSpaceKHR  imageColorSpace",
                                     { "imageExtent" => VkExtent2D },
                                     "uint32_t  imageArrayLayers",
                                     "VkImageUsageFlags  imageUsage",
                                     "VkSharingMode  imageSharingMode",
                                     "uint32_t  queueFamilyIndexCount",
                                     "uint32_t * pQueueFamilyIndices",
                                     "VkSurfaceTransformFlagBitsKHR  preTransform",
                                     "VkCompositeAlphaFlagBitsKHR  compositeAlpha",
                                     "VkPresentModeKHR  presentMode",
                                     "VkBool32  clipped",
                                     "VkSwapchainKHR  oldSwapchain"]

  VkTextureLODGatherFormatPropertiesAMD = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkBool32  supportsTextureGatherLODBiasAMD"]

  VkValidationCacheCreateInfoEXT = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkValidationCacheCreateFlagsEXT  flags",
                                           "size_t  initialDataSize",
                                           "void * pInitialData"]

  VkValidationFlagsEXT = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "uint32_t  disabledValidationCheckCount",
                                 "VkValidationCheckEXT * pDisabledValidationChecks"]

  VkViSurfaceCreateInfoNN = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkViSurfaceCreateFlagsNN  flags",
                                    "void * window"]

  VkWaylandSurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkWaylandSurfaceCreateFlagsKHR  flags",
                                          "wl_display * display",
                                          "wl_surface * surface"]

  VkWin32KeyedMutexAcquireReleaseInfoKHR = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  acquireCount",
                                                   "VkDeviceMemory * pAcquireSyncs",
                                                   "uint64_t * pAcquireKeys",
                                                   "uint32_t * pAcquireTimeouts",
                                                   "uint32_t  releaseCount",
                                                   "VkDeviceMemory * pReleaseSyncs",
                                                   "uint64_t * pReleaseKeys"]

  VkWin32KeyedMutexAcquireReleaseInfoNV = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "uint32_t  acquireCount",
                                                  "VkDeviceMemory * pAcquireSyncs",
                                                  "uint64_t * pAcquireKeys",
                                                  "uint32_t * pAcquireTimeoutMilliseconds",
                                                  "uint32_t  releaseCount",
                                                  "VkDeviceMemory * pReleaseSyncs",
                                                  "uint64_t * pReleaseKeys"]

  VkWin32SurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkWin32SurfaceCreateFlagsKHR  flags",
                                        "HINSTANCE  hinstance",
                                        "HWND  hwnd"]

  VkWriteDescriptorSet = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkDescriptorSet  dstSet",
                                 "uint32_t  dstBinding",
                                 "uint32_t  dstArrayElement",
                                 "uint32_t  descriptorCount",
                                 "VkDescriptorType  descriptorType",
                                 "VkDescriptorImageInfo * pImageInfo",
                                 "VkDescriptorBufferInfo * pBufferInfo",
                                 "VkBufferView * pTexelBufferView"]

  VkWriteDescriptorSetAccelerationStructureNV = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "uint32_t  accelerationStructureCount",
                                                        "VkAccelerationStructureNV * pAccelerationStructures"]

  VkWriteDescriptorSetInlineUniformBlockEXT = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "uint32_t  dataSize",
                                                      "void * pData"]

  VkXcbSurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkXcbSurfaceCreateFlagsKHR  flags",
                                      "xcb_connection_t * connection",
                                      "xcb_window_t  window"]

  VkXlibSurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkXlibSurfaceCreateFlagsKHR  flags",
                                       "Display * dpy",
                                       "Window  window"]

end
