include "Errors.thrift"

namespace java com.xiaomi.infra.galaxy.sds.thrift
namespace php SDS.Common
namespace py sds.common
namespace go sds.common

/**
 * client端读写超时时间（ms）
 */
const double DEFAULT_CLIENT_TIMEOUT = 10000
/**
 * client端DDL操作超时时间（ms）
 */
const double DEFAULT_ADMIN_CLIENT_TIMEOUT = 30000
/**
 * client端连接超时时间（ms）
 */
const double DEFAULT_CLIENT_CONN_TIMEOUT = 3000
/**
 * HTTP RPC服务地址
 */
const string DEFAULT_SERVICE_ENDPOINT = 'http://sds.api.xiaomi.com'
/**
 * HTTPS RPC服务地址
 */
const string DEFAULT_SECURE_SERVICE_ENDPOINT = 'https://sds.api.xiaomi.com'
/**
 * RPC根路径
 */
const string API_ROOT_PATH = '/v1/api';
/**
 * 权限RPC路径
 */
const string AUTH_SERVICE_PATH =  '/v1/api/auth'
/**
 * 管理操作RPC路径
 */
const string ADMIN_SERVICE_PATH = '/v1/api/admin'
/**
 * 表数据访问RPC路径
 */
const string TABLE_SERVICE_PATH = '/v1/api/table'

/**
 * 版本号，规则详见http://semver.org
 */
struct Version {
  /**
   * 主版本号，不同版本号之间不兼容
   */
  1: required i32 major = 1,
  /**
   * 次版本号，不同版本号之间向后兼容
   */
  2: required i32 minor = 0,
  /**
   * 构建版本号，不同版本之间互相兼容
   */
  3: optional string patch = '6d887382',
  /**
   * 附加信息
   */
  4: optional string comments = ''
}

/**
 * 结构化存储基础接口
 */
service BaseService {
  /**
   * 获取服务端版本
   */
  Version getServerVersion() throws (1: Errors.ServiceException se),
  /**
   * 检查版本兼容性
   */
  void validateClientVersion(1:Version clientVersion) throws (1: Errors.ServiceException se),
  /**
   * 获取服务器端当前时间，1970/0/0开始的秒数，可用作ping检查联通性
   */
  i64 getServerTime(),
}

