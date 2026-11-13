#ifndef SYMPHONY_ERRNO_H
#define SYMPHONY_ERRNO_H
/* Single-thread runtime: no TLS. Successful calls do not reset errno. */
extern int sym_errno;
#define errno sym_errno
#define EINVAL 22
#define ERANGE 34
#endif
