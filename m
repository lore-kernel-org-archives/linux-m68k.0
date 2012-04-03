From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 51/69] TTY: 68328serial, remove serial_state and friends
Date: Tue, 3 Apr 2012 14:48:17 +0200
Message-ID: <CAMuHMdWC6r_e1ebpbiGNJQGYmE6grvzt60-zCg2ZJO=Z+bnPMw@mail.gmail.com>
References: <1333367693-3244-1-git-send-email-jslaby@suse.cz>
	<1333367693-3244-52-git-send-email-jslaby@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1333367693-3244-52-git-send-email-jslaby@suse.cz>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>
Cc: gregkh@linuxfoundation.org, alan@linux.intel.com, linux-kernel@vger.kernel.org, jirislaby@gmail.com

[ Added Greg as this is m68knommu territory, but I guess he go all 12 p=
atches
  through linux-m68k anyway ]

On Mon, Apr 2, 2012 at 13:54, Jiri Slaby <jslaby@suse.cz> wrote:
> serial_state in 68328serial.h is a duplicated structure. One is
> defined in linux/serial.h. So let us use that instead. And since the
> serial flags are identical, use ones from there too.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> ---
> =C2=A0drivers/tty/serial/68328serial.c | =C2=A0 55 +++++++++++-------=
---------
> =C2=A0drivers/tty/serial/68328serial.h | =C2=A0 76 ------------------=
--------------------
> =C2=A02 files changed, 22 insertions(+), 109 deletions(-)
>
> diff --git a/drivers/tty/serial/68328serial.c b/drivers/tty/serial/68=
328serial.c
> index 5ce7825..bf5f811 100644
> --- a/drivers/tty/serial/68328serial.c
> +++ b/drivers/tty/serial/68328serial.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <asm/dbg.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/errno.h>
> +#include <linux/serial.h>
> =C2=A0#include <linux/signal.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/timer.h>
> @@ -79,18 +80,6 @@ struct m68k_serial *m68k_consinfo =3D 0;
>
> =C2=A0struct tty_driver *serial_driver;
>
> -/* number of characters left in xmit buffer before we ask for more *=
/
> -#define WAKEUP_CHARS 256
> -
> -/* Debugging... DEBUG_INTR is bad to use when one of the zs
> - * lines is your console ;(
> - */
> -#undef SERIAL_DEBUG_INTR
> -#undef SERIAL_DEBUG_OPEN
> -#undef SERIAL_DEBUG_FLOW
> -
> -#define RS_ISR_PASS_LIMIT 256
> -
> =C2=A0static void change_speed(struct m68k_serial *info);
>
> =C2=A0/*
> @@ -363,7 +352,7 @@ static int startup(struct m68k_serial * info)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0m68328_uart *uart =3D &uart_addr[info->lin=
e];
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;
>
> - =C2=A0 =C2=A0 =C2=A0 if (info->flags & S_INITIALIZED)
> + =C2=A0 =C2=A0 =C2=A0 if (info->flags & ASYNC_INITIALIZED)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!info->xmit_buf) {
> @@ -404,7 +393,7 @@ static int startup(struct m68k_serial * info)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0change_speed(info);
>
> - =C2=A0 =C2=A0 =C2=A0 info->flags |=3D S_INITIALIZED;
> + =C2=A0 =C2=A0 =C2=A0 info->flags |=3D ASYNC_INITIALIZED;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_restore(flags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
> @@ -419,7 +408,7 @@ static void shutdown(struct m68k_serial * info)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long =C2=A0 flags;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0uart->ustcnt =3D 0; /* All off! */
> - =C2=A0 =C2=A0 =C2=A0 if (!(info->flags & S_INITIALIZED))
> + =C2=A0 =C2=A0 =C2=A0 if (!(info->flags & ASYNC_INITIALIZED))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_save(flags);
> @@ -432,7 +421,7 @@ static void shutdown(struct m68k_serial * info)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info->tty)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(TTY_IO=
_ERROR, &info->tty->flags);
>
> - =C2=A0 =C2=A0 =C2=A0 info->flags &=3D ~S_INITIALIZED;
> + =C2=A0 =C2=A0 =C2=A0 info->flags &=3D ~ASYNC_INITIALIZED;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_restore(flags);
> =C2=A0}
>
> @@ -835,11 +824,11 @@ static int set_serial_info(struct m68k_serial *=
 info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((new_seria=
l.baud_base !=3D info->baud_base) ||
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(new_serial.type !=3D info->type) ||
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(new_serial.close_delay !=3D info->close_delay) ||
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((ne=
w_serial.flags & ~S_USR_MASK) !=3D
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(info->flags & ~S_USR_MASK)))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((ne=
w_serial.flags & ~ASYNC_USR_MASK) !=3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(info->flags & ~ASYNC_USR_MASK)))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EPERM;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->flags =3D ((=
info->flags & ~S_USR_MASK) |
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(new_serial.flags & S_USR_MASK));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->flags =3D ((=
info->flags & ~ASYNC_USR_MASK) |
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(new_serial.flags & ASYNC_USR_MASK))=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->custom_d=
ivisor =3D new_serial.custom_divisor;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto check_and=
_exit;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> @@ -853,8 +842,8 @@ static int set_serial_info(struct m68k_serial * i=
nfo,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->baud_base =3D new_serial.baud_base;
> - =C2=A0 =C2=A0 =C2=A0 info->flags =3D ((info->flags & ~S_FLAGS) |
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (new_serial.flags & S_FLAGS));
> + =C2=A0 =C2=A0 =C2=A0 info->flags =3D ((info->flags & ~ASYNC_FLAGS) =
|
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (new_serial.flags & ASYNC_FLAGS));
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->type =3D new_serial.type;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->close_delay =3D new_serial.close_del=
ay;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->closing_wait =3D new_serial.closing_=
wait;
> @@ -1022,13 +1011,13 @@ static void rs_close(struct tty_struct *tty, =
struct file * filp)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_rest=
ore(flags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> - =C2=A0 =C2=A0 =C2=A0 info->flags |=3D S_CLOSING;
> + =C2=A0 =C2=A0 =C2=A0 info->flags |=3D ASYNC_CLOSING;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Now we wait for the transmit buffer to =
clear; and we notify
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the line discipline to only process XON=
/XOFF characters.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tty->closing =3D 1;
> - =C2=A0 =C2=A0 =C2=A0 if (info->closing_wait !=3D S_CLOSING_WAIT_NON=
E)
> + =C2=A0 =C2=A0 =C2=A0 if (info->closing_wait !=3D ASYNC_CLOSING_WAIT=
_NONE)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tty_wait_until=
_sent(tty, info->closing_wait);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * At this point we stop accepting input. =
=C2=A0To do this, we
> @@ -1064,7 +1053,7 @@ static void rs_close(struct tty_struct *tty, st=
ruct file * filp)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interr=
uptible(&info->open_wait);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> - =C2=A0 =C2=A0 =C2=A0 info->flags &=3D ~(S_NORMAL_ACTIVE|S_CLOSING);
> + =C2=A0 =C2=A0 =C2=A0 info->flags &=3D ~(ASYNC_NORMAL_ACTIVE|ASYNC_C=
LOSING);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interruptible(&info->close_wait);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_restore(flags);
> =C2=A0}
> @@ -1083,7 +1072,7 @@ void rs_hangup(struct tty_struct *tty)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown(info);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->event =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->count =3D 0;
> - =C2=A0 =C2=A0 =C2=A0 info->flags &=3D ~S_NORMAL_ACTIVE;
> + =C2=A0 =C2=A0 =C2=A0 info->flags &=3D ~ASYNC_NORMAL_ACTIVE;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->tty =3D NULL;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interruptible(&info->open_wait);
> =C2=A0}
> @@ -1104,10 +1093,10 @@ static int block_til_ready(struct tty_struct =
*tty, struct file * filp,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the device is in the middle of being=
 closed, then block
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * until it's done, and then try again.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> - =C2=A0 =C2=A0 =C2=A0 if (info->flags & S_CLOSING) {
> + =C2=A0 =C2=A0 =C2=A0 if (info->flags & ASYNC_CLOSING) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interruptible_=
sleep_on(&info->close_wait);
> =C2=A0#ifdef SERIAL_DO_RESTART
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->flags & =
S_HUP_NOTIFY)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->flags & =
ASYNC_HUP_NOTIFY)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EAGAIN;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -ERESTARTSYS;
> @@ -1122,7 +1111,7 @@ static int block_til_ready(struct tty_struct *t=
ty, struct file * filp,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((filp->f_flags & O_NONBLOCK) ||
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tty->flags & (1 << TTY_IO_E=
RROR))) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->flags |=3D S=
_NORMAL_ACTIVE;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->flags |=3D A=
SYNC_NORMAL_ACTIVE;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> @@ -1147,9 +1136,9 @@ static int block_til_ready(struct tty_struct *t=
ty, struct file * filp,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_enab=
le();
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0current->state=
 =3D TASK_INTERRUPTIBLE;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tty_hung_u=
p_p(filp) ||
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(in=
fo->flags & S_INITIALIZED)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(in=
fo->flags & ASYNC_INITIALIZED)) {
> =C2=A0#ifdef SERIAL_DO_RESTART
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (info->flags & S_HUP_NOTIFY)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (info->flags & ASYNC_HUP_NOTIFY)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D -EAGAIN;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D -ERESTARTSYS;
> @@ -1158,7 +1147,7 @@ static int block_til_ready(struct tty_struct *t=
ty, struct file * filp,
> =C2=A0#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(info->flags =
& S_CLOSING) && do_clocal)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(info->flags =
& ASYNC_CLOSING) && do_clocal)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (signal_pe=
nding(current)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0retval =3D -ERESTARTSYS;
> @@ -1176,7 +1165,7 @@ static int block_til_ready(struct tty_struct *t=
ty, struct file * filp,
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval;
> - =C2=A0 =C2=A0 =C2=A0 info->flags |=3D S_NORMAL_ACTIVE;
> + =C2=A0 =C2=A0 =C2=A0 info->flags |=3D ASYNC_NORMAL_ACTIVE;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> diff --git a/drivers/tty/serial/68328serial.h b/drivers/tty/serial/68=
328serial.h
> index 3d2faab..a804ea5 100644
> --- a/drivers/tty/serial/68328serial.h
> +++ b/drivers/tty/serial/68328serial.h
> @@ -11,69 +11,6 @@
> =C2=A0#ifndef _MC683XX_SERIAL_H
> =C2=A0#define _MC683XX_SERIAL_H
>
> -
> -struct serial_struct {
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 type;
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 line;
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 port;
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 irq;
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 flags;
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 xmit_fifo_size;
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 custom_divisor;
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 baud_base;
> - =C2=A0 =C2=A0 =C2=A0 unsigned short =C2=A0close_delay;
> - =C2=A0 =C2=A0 =C2=A0 char =C2=A0 =C2=A0reserved_char[2];
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 hub6; =C2=A0/* FIXME: We don=
't have AT&T Hub6 boards! */
> - =C2=A0 =C2=A0 =C2=A0 unsigned short =C2=A0closing_wait; /* time to =
wait before closing */
> - =C2=A0 =C2=A0 =C2=A0 unsigned short =C2=A0closing_wait2; /* no long=
er used... */
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 reserved[4];
> -};
> -
> -/*
> - * For the close wait times, 0 means wait forever for serial port to
> - * flush its output. =C2=A065535 means don't wait at all.
> - */
> -#define S_CLOSING_WAIT_INF =C2=A0 =C2=A0 0
> -#define S_CLOSING_WAIT_NONE =C2=A0 =C2=A065535
> -
> -/*
> - * Definitions for S_struct (and serial_struct) flags field
> - */
> -#define S_HUP_NOTIFY 0x0001 /* Notify getty on hangups and closes
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on the callout port */
> -#define S_FOURPORT =C2=A00x0002 =C2=A0 =C2=A0 /* Set OU1, OUT2 per A=
ST Fourport settings */
> -#define S_SAK =C2=A00x0004 =C2=A0/* Secure Attention Key (Orange boo=
k) */
> -#define S_SPLIT_TERMIOS 0x0008 /* Separate termios for dialin/callou=
t */
> -
> -#define S_SPD_MASK =C2=A0 =C2=A0 0x0030
> -#define S_SPD_HI =C2=A0 =C2=A0 =C2=A0 0x0010 =C2=A0/* Use 56000 inst=
ead of 38400 bps */
> -
> -#define S_SPD_VHI =C2=A0 =C2=A0 =C2=A00x0020 =C2=A0/* Use 115200 ins=
tead of 38400 bps */
> -#define S_SPD_CUST =C2=A0 =C2=A0 0x0030 =C2=A0/* Use user-specified =
divisor */
> -
> -#define S_SKIP_TEST =C2=A0 =C2=A00x0040 /* Skip UART test during aut=
oconfiguration */
> -#define S_AUTO_IRQ =C2=A00x0080 /* Do automatic IRQ during autoconfi=
guration */
> -#define S_SESSION_LOCKOUT 0x0100 /* Lock out cua opens based on sess=
ion */
> -#define S_PGRP_LOCKOUT =C2=A0 =C2=A00x0200 /* Lock out cua opens bas=
ed on pgrp */
> -#define S_CALLOUT_NOHUP =C2=A0 0x0400 /* Don't do hangups for cua de=
vice */
> -
> -#define S_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A00x0FFF =C2=A0/* Possible =
legal S flags */
> -#define S_USR_MASK 0x0430 =C2=A0 =C2=A0 =C2=A0/* Legal flags that no=
n-privileged
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* users can set or reset */
> -
> -/* Internal flags used only by kernel/chr_drv/serial.c */
> -#define S_INITIALIZED =C2=A00x80000000 /* Serial port was initialize=
d */
> -#define S_CALLOUT_ACTIVE =C2=A0 =C2=A0 =C2=A0 0x40000000 /* Call out=
 device is active */
> -#define S_NORMAL_ACTIVE =C2=A0 =C2=A0 =C2=A0 =C2=A00x20000000 /* Nor=
mal device is active */
> -#define S_BOOT_AUTOCONF =C2=A0 =C2=A0 =C2=A0 =C2=A00x10000000 /* Aut=
oconfigure port on bootup */
> -#define S_CLOSING =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
08000000 /* Serial port is closing */
> -#define S_CTS_FLOW =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04000=
000 /* Do CTS flow control */
> -#define S_CHECK_CD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02000=
000 /* i.e., CLOCAL */
> -
> -/* Software state per channel */
> -
> -#ifdef __KERNEL__
> -
> =C2=A0/*
> =C2=A0* I believe this is the optimal setting that reduces the number=
 of interrupts.
> =C2=A0* At high speeds the output might become a little "bursted" (us=
e USTCNT_TXHE
> @@ -162,25 +99,12 @@ struct m68k_serial {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0wait_queue_head_t =C2=A0 =C2=A0 =C2=A0 clo=
se_wait;
> =C2=A0};
>
> -
> =C2=A0#define SERIAL_MAGIC 0x5301
>
> -/*
> - * The size of the serial xmit buffer is 1 page, or 4096 bytes
> - */
> -#define SERIAL_XMIT_SIZE 4096
> -
> -/*
> - * Events are used to schedule things to happen at timer-interrupt
> - * time, instead of at rs interrupt time.
> - */
> -#define RS_EVENT_WRITE_WAKEUP =C2=A00
> -
> =C2=A0/*
> =C2=A0* Define the number of ports supported and their irqs.
> =C2=A0*/
> =C2=A0#define NR_PORTS 1
> =C2=A0#define UART_IRQ_DEFNS {UART_IRQ_NUM}
>
> -#endif /* __KERNEL__ */
> =C2=A0#endif /* !(_MC683XX_SERIAL_H) */
> --
> 1.7.9.2

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
