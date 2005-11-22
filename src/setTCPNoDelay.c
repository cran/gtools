#include <R.h>
#include <Rinternals.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h>

#define TCP_NODELAY 1

/* Convert integer status into a string error code */
void checkStatus(int status,
                 char* status_str,
                 int status_len)
{
  status_len = status_len>1000?1000:status_len;

  switch(status)
    {
    case EBADF:
      strncpy( status_str,
                            "EBADF: Invalid descriptor.",
                            status_len);
      break;
    case ENOTSOCK:
      strncpy( status_str,
               "ENOTSOCK: Descriptor is a file, not a socket.",
               status_len);
      break;
    case ENOPROTOOPT:
      strncpy( status_str,
               "ENOPROTOOPT: The option is unknown at the level indicated.",
               status_len);
      break;
    case EFAULT: 
      strncpy( status_str,
               "EFAULT: invalid pointer",
               status_len);
      break;
    case EINVAL:
      strncpy( status_str,
               "EINVAL: optlen invalid in setsockopt",
               status_len);
      break;
    case 0:
      strncpy( status_str,
               "SUCCESS",
               status_len);
      break;
    default:
      strncpy(status_str, strerror(status), status_len);  
      break;
    }

  status_str[status_len-1] = 0x0;  /* Just in case */
}

/* Function to de-nagle a TCP socket connection */
void R_setTCPNoDelay(int *socket,
                     int* flag,
                     int* status,
                     char** status_str,
                     int* status_len)
{
  int off;
  
  /* ensure that we use only 0,1 values */
  off = (*flag) ? 1 : 0;
  
  *status = setsockopt(
                       *socket,
                       IPPROTO_TCP,
                       TCP_NODELAY,
                       (char * )&off,
                       sizeof ( off )
                       );


  checkStatus(*status, status_str[0], *status_len);
  
  return;
}


/* function to check socket options */
/* NOT USED...
void R_getsockopt(int *s,
                  int *level,
                  int *optname,
                  int *optval,
                  int *optlen,
                  int *status,
                  char *status_str,
                  int *status_len)
{
  *status = getsockopt(*s, *level, *optname, optval, optlen);

  checkStatus(*status, status_str, *status_len);
  
}
*/

/* function to set socket options */
/* NOT USED ...
void R_setsockopt(int *s,
                  int *level,
                  int *optname,
                  int *optval,
                  int *optlen,
                  int *status,
                  char *status_str,
                  int *status_len)
{

  *status = setsockopt(*s, *level,  *optname, optval, *optlen);

  checkStatus(*status, status_str, *status_len);
}
*/

