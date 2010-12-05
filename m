From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Atari SCSI - ST-DMA locking and error handling fixes
Date: Sun, 5 Dec 2010 10:54:45 +0100
Message-ID: <AANLkTikQDb4h1s1q4VJniK+naNjcPOHaVyu14NYSzj_X@mail.gmail.com>
References: <20090326123822.GD8081@marenka.net>
	<10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
	<10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
	<alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
	<1239696787.2049.8.camel@petr>
	<alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
	<1239698381.2049.25.camel@petr>
	<alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
	<1239774966.20245.4.camel@petr>
	<alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
	<1239862075.12777.14.camel@petr>
	<alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
	<1239868903.12777.25.camel@petr>
	<alpine.DEB.1.00.0904170314220.18855@zirkon.biophys.uni-duesseldorf.de>
	<alpine.DEB.1.00.0904190308310.8939@zirkon.biophys.uni-duesseldorf.de>
	<alpine.DEB.1.00.0904260751590.30061@zirkon.biophys.uni-duesseldorf.de>
	<alpine.DEB.1.00.0904260909510.32441@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:64980 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752734Ab0LEJyr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 5 Dec 2010 04:54:47 -0500
Received: by fxm20 with SMTP id 20so3429346fxm.19
        for <linux-m68k@vger.kernel.org>; Sun, 05 Dec 2010 01:54:46 -0800 (PST)
In-Reply-To: <alpine.DEB.1.00.0904260909510.32441@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Michael Schmitz <schmitzmic@googlemail.com>
Cc: Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

On Sun, Apr 26, 2009 at 09:24, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
> some fixes to the Atari NCR5380 SCSI driver: if the ST-DMA lock canno=
t be taken
> in the queue function, indicate host busy to the block layer. Fix ret=
urn codes
> of abort and reset functions, and add scsi_unregister to module exit.
> Error handling is still messed up, most likely due to missing ST-DMA =
lock in
> abort and reset. This is still WIP, but might benefit users with a Fa=
lcon less
> prone to SCSI lockups, i.e. more stable SCSI clock signal.

Any news on this one ("still WIP")?

> Signed-off-by: Michael Schmitz <schmitz@debian.org>
>
> =C2=A0Michael
>
> ---
> =C2=A0drivers/scsi/atari_NCR5380.c | =C2=A0 78 ++++++++++++++++++++++=
+++++--------------
> =C2=A0drivers/scsi/atari_scsi.c =C2=A0 =C2=A0| =C2=A0 47 ++++++++++++=
+++++++++----
> =C2=A02 files changed, 91 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/scsi/atari_NCR5380.c b/drivers/scsi/atari_NCR538=
0.c
> index 0471f88..3ba46d5 100644
> --- a/drivers/scsi/atari_NCR5380.c
> +++ b/drivers/scsi/atari_NCR5380.c
> @@ -966,13 +966,6 @@ static int NCR5380_queue_command(Scsi_Cmnd *cmd,=
 void (*done)(Scsi_Cmnd *))
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd->result =3D 0;
>
> - =C2=A0 =C2=A0 =C2=A0 /*
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* Insert the cmd into the issue queue. N=
ote that REQUEST SENSE
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* commands are added to the head of the =
queue since any command will
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* clear the contingent allegiance condit=
ion that exists and the
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* sense data is only guaranteed to be va=
lid while the condition exists.
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_save(flags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ++guenther: now that the issue queue is=
 being set up, we can lock ST-DMA.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Otherwise a running NCR5380_main may st=
eal the lock.
> @@ -987,10 +980,32 @@ static int NCR5380_queue_command(Scsi_Cmnd *cmd=
, void (*done)(Scsi_Cmnd *))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * alter queues and touch the lock.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_A_TT()) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int rv;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MSch: since we =
may now get called from softirq context here,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we cannot =
always sleep while waiting for the lock.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Use status=
 from falcon_get_lock() to detect if the lock was
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* successful=
ly taken, and return appropriate status to midlevel
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* otherwise.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We used to=
 pause the midlevel SCSI timer here; races between
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* command ti=
meout and lowlevel error handling should not hurt
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* because th=
e command isn't in any of the queues yet.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* perhaps sto=
p command timer here */
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 falcon_get_lock();
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rv =3D falcon_get_=
lock();
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* perhaps res=
tart command timer here */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rv) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 local_irq_restore(flags);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return SCSI_MLQUEUE_HOST_BUSY;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Insert the cmd into the issue queue. N=
ote that REQUEST SENSE
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* commands are added to the head of the =
queue since any command will
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* clear the contingent allegiance condit=
ion that exists and the
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* sense data is only guaranteed to be va=
lid while the condition exists.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(hostdata->issue_queue) || (cmd->cmnd=
[0] =3D=3D REQUEST_SENSE)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIST(cmd, host=
data->issue_queue);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_NEXT(cmd, =
hostdata->issue_queue);
> @@ -1014,10 +1029,12 @@ static int NCR5380_queue_command(Scsi_Cmnd *c=
md, void (*done)(Scsi_Cmnd *))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If we're not in an interrupt, we can ca=
ll NCR5380_main()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * unconditionally, because it cannot be a=
lready running.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> - =C2=A0 =C2=A0 =C2=A0 if (in_interrupt() || ((flags >> 8) & 7) >=3D =
6)
> + =C2=A0 =C2=A0 =C2=A0 /* As of 2.6.19, the coroutine has to be put o=
n the task queue instead
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* of being called directly. It might sti=
ll be called directly if not
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* in softirq, though. Need to test this.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0queue_main();
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NCR5380_main(NULL)=
;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> @@ -1463,6 +1480,7 @@ static int NCR5380_select(struct Scsi_Host *ins=
tance, Scsi_Cmnd *cmd, int tag)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ARB_PRINTK("scsi%d: arbitration complete\n=
", HOSTNO);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hostdata->connected) {
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NCR5380_write(=
MODE_REG, MR_BASE);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> @@ -2065,7 +2083,6 @@ static void NCR5380_information_transfer(struct=
 Scsi_Host *instance)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The preferred transfer met=
hod is going to be
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * PSEUDO-DMA for systems tha=
t are strictly PIO,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since we can let the hardwa=
re do the handshaking.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * For this to work, we need =
to know the transfersize
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ahead of time, since the p=
seudo-DMA code will sit
> @@ -2631,7 +2648,7 @@ static void NCR5380_reselect(struct Scsi_Host *=
instance)
> =C2=A0* =C2=A0 =C2=A0 host byte of the result field to, if zero DID_A=
BORTED is
> =C2=A0* =C2=A0 =C2=A0 used.
> =C2=A0*
> - * Returns : 0 - success, -1 on failure.
> + * Returns : SUCCESS - success, FAILED on failure.
> =C2=A0*
> =C2=A0* XXX - there is no way to abort the command that is currently
> =C2=A0* =C2=A0 =C2=A0 =C2=A0connected, you have to wait for it to com=
plete. =C2=A0If this is
> @@ -2701,11 +2718,12 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0local_irq_restore(flags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0cmd->scsi_done(cmd);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0falcon_release_lock_if_possible(hostdata);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return SCSI_ABORT_SUCCESS;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return SUCCESS;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {
> -/* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 local_irq_restore(flags); */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /* not sure */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 local_irq_restore(flags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0printk("scsi%d: abort of connected command failed!\n", HO=
STNO);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return SCSI_ABORT_ERROR;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return FAILED;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0#endif
> @@ -2729,7 +2747,7 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 * yet... */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tmp->scsi_done(tmp);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0falcon_release_lock_if_possible(hostdata);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return SCSI_ABORT_SUCCESS;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return SUCCESS;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> @@ -2747,7 +2765,7 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hostdata->connected) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_rest=
ore(flags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ABRT_PRINTK("s=
csi%d: abort failed, command connected.\n", HOSTNO);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return SCSI_ABORT_=
SNOOZE;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FAILED;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/*
> @@ -2782,7 +2800,7 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ABRT_PRINTK("scsi%d: aborting disconnected command.\n", H=
OSTNO);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (NCR5380_select(instance, cmd, (int)cmd->tag))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return SCSI_ABORT_BUSY;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FAILED;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ABRT_PRINTK("scsi%d: nexus reestablished.\n", HOSTNO);
>
> @@ -2809,7 +2827,7 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l=
ocal_irq_restore(flags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
mp->scsi_done(tmp);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
alcon_release_lock_if_possible(hostdata);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
SCSI_ABORT_SUCCESS;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
SUCCESS;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> @@ -2835,7 +2853,9 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0falcon_release_lock_if_possible(hostdata);
>
> - =C2=A0 =C2=A0 =C2=A0 return SCSI_ABORT_NOT_RUNNING;
> + =C2=A0 =C2=A0 =C2=A0 /* NCR5380 has FAILED here */
> + =C2=A0 =C2=A0 =C2=A0 /* return SUCCESS; */
> + =C2=A0 =C2=A0 =C2=A0 return FAILED;
> =C2=A0}
>
>
> @@ -2844,16 +2864,18 @@ int NCR5380_abort(Scsi_Cmnd *cmd)
> =C2=A0*
> =C2=A0* Purpose : reset the SCSI bus.
> =C2=A0*
> - * Returns : SCSI_RESET_WAKEUP
> + * Returns : SUCCESS
> =C2=A0*
> =C2=A0*/
>
> +#undef FALCON_RESET_KILL_QUEUES
> +
> =C2=A0static int NCR5380_bus_reset(Scsi_Cmnd *cmd)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SETUP_HOSTDATA(cmd->device->host);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;
> -#if 1
> +#if defined(FALCON_RESET_KILL_QUEUES)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Scsi_Cmnd *connected, *disconnected_queue;
> =C2=A0#endif
>
> @@ -2878,7 +2900,8 @@ static int NCR5380_bus_reset(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * through anymore ... */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(void)NCR5380_read(RESET_PARITY_INTERRUPT_=
REG);
>
> -#if 1 =C2=A0/* XXX Should now be done by midlevel code, but it's bro=
ken XXX */
> +#if defined(FALCON_RESET_KILL_QUEUES)
> + =C2=A0 =C2=A0 =C2=A0 /* XXX Should now be done by midlevel code, bu=
t it's broken XXX */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX see below =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XXX */
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* MSch: old-style reset: actually abort a=
ll command processing here */
> @@ -2934,7 +2957,7 @@ static int NCR5380_bus_reset(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the midlevel code that the reset was SU=
CCESSFUL, and there is no
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * need to 'wake up' the commands by a req=
uest_sense
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> - =C2=A0 =C2=A0 =C2=A0 return SCSI_RESET_SUCCESS | SCSI_RESET_BUS_RES=
ET;
> + =C2=A0 =C2=A0 =C2=A0 return SUCCESS;
> =C2=A0#else /* 1 */
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* MSch: new-style reset handling: let the=
 mid-level do what it can */
> @@ -2982,6 +3005,7 @@ static int NCR5380_bus_reset(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_restore(flags);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* we did no complete reset of all command=
s, so a wakeup is required */
> - =C2=A0 =C2=A0 =C2=A0 return SCSI_RESET_WAKEUP | SCSI_RESET_BUS_RESE=
T;
> -#endif /* 1 */
> + =C2=A0 =C2=A0 =C2=A0 /* The new error handler code implicitly does =
this for us anyway */
> + =C2=A0 =C2=A0 =C2=A0 return SUCCESS;
> +#endif /* defined(FALCON_RESET_KILL_QUEUES) */
> =C2=A0}
> diff --git a/drivers/scsi/atari_scsi.c b/drivers/scsi/atari_scsi.c
> index ad7a23a..9ebfbc6 100644
> --- a/drivers/scsi/atari_scsi.c
> +++ b/drivers/scsi/atari_scsi.c
> @@ -196,7 +196,7 @@ static unsigned long atari_dma_xfer_len(unsigned =
long wanted_len,
> =C2=A0static irqreturn_t scsi_tt_intr(int irq, void *dummy);
> =C2=A0static irqreturn_t scsi_falcon_intr(int irq, void *dummy);
> =C2=A0static void falcon_release_lock_if_possible(struct NCR5380_host=
data *hostdata);
> -static void falcon_get_lock(void);
> +static int falcon_get_lock(void);
> =C2=A0#ifdef CONFIG_ATARI_SCSI_RESET_BOOT
> =C2=A0static void atari_scsi_reset_boot(void);
> =C2=A0#endif
> @@ -498,6 +498,16 @@ static int falcon_dont_release =3D 0;
> =C2=A0* again (but others waiting longer more probably will win).
> =C2=A0*/
>
> +/*
> + * MSch 20061228: in 2.6.x, the fairness wait appears to open a race=
 with
> + * concurrent use of the lock by the IDE driver. Once the lock is ta=
ken by
> + * IDE, the SCSI queuecmd function can no longer schedule because it=
 is run
> + * from softirq context a lot.
> + * Disable the fairness wait until I have had time to sort out the l=
ock issues.
> + */
> +#undef FALCON_FAIRNESS_WAIT
> +#define FALCON_NEVER_SLEEP 1
> +
> =C2=A0static void falcon_release_lock_if_possible(struct NCR5380_host=
data *hostdata)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;
> @@ -519,7 +529,9 @@ static void falcon_release_lock_if_possible(struc=
t NCR5380_hostdata *hostdata)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0falcon_got_loc=
k =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdma_release(=
);
> +#if defined(FALCON_FAIRNESS_WAIT)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up(&falco=
n_fairness_wait);
> +#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_restore(flags);
> @@ -540,21 +552,37 @@ static void falcon_release_lock_if_possible(str=
uct NCR5380_hostdata *hostdata)
> =C2=A0* Complicated, complicated.... Sigh...
> =C2=A0*/
>
> -static void falcon_get_lock(void)
> +/* MSch 20061229: in order to avoid sleeping when the lock is not av=
ailable,
> + * return the current lock state here. atari_queue_command() will th=
en return
> + * with error, causing the midlevel code to pause request submission=
=2E
> + */
> +static int falcon_get_lock(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_A_TT())
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_save(flags);
>
> - =C2=A0 =C2=A0 =C2=A0 while (!in_irq() && falcon_got_lock && stdma_o=
thers_waiting())
> +#if defined(FALCON_FAIRNESS_WAIT)
> + =C2=A0 =C2=A0 =C2=A0 /* MSch: we may not sleep even while in softir=
q ! */
> + =C2=A0 =C2=A0 =C2=A0 while (!in_interrupt() && falcon_got_lock && s=
tdma_others_waiting())
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep_on(&falc=
on_fairness_wait);
> -
> +#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0while (!falcon_got_lock) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (in_irq())
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0panic("Falcon SCSI hasn't ST-DMA lock in interrupt");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we may not slee=
p in soft interrupts neither, so bail out */
> +#if defined(FALCON_NEVER_SLEEP)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stdma_islocked=
()) {
> +#else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (in_softirq() &=
& stdma_islocked()) {
> +#endif
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 // printk(KERN_INFO "Falcon SCSI does not hold ST-DMA lock in s=
oftirq!\n" );
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 local_irq_restore(flags);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return 1;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!falcon_tr=
ying_lock) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0falcon_trying_lock =3D 1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0stdma_lock(scsi_falcon_intr, NULL);
> @@ -569,6 +597,8 @@ static void falcon_get_lock(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_restore(flags);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!falcon_got_lock)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic("Falcon =
SCSI: someone stole the lock :-(\n");
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> =C2=A0}
>
>
> @@ -589,7 +619,7 @@ int atari_queue_command(Scsi_Cmnd *cmd, void (*do=
ne)(Scsi_Cmnd *))
> =C2=A0#endif
>
>
> -int __init atari_scsi_detect(struct scsi_host_template *host)
> +int atari_scsi_detect(struct scsi_host_template *host)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0static int called =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct Scsi_Host *instance;
> @@ -652,6 +682,8 @@ int __init atari_scsi_detect(struct scsi_host_tem=
plate *host)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atari_dma_phys=
_buffer =3D virt_to_phys(atari_dma_buffer);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atari_dma_orig=
_addr =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "a=
tari_scsi_detect: ST-RAM "
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 "double buffer at %p\n", atari_dma_phys_buffer);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0instance =3D scsi_register(host, sizeof(st=
ruct NCR5380_hostdata));
> @@ -745,6 +777,7 @@ int atari_scsi_release(struct Scsi_Host *sh)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_A_TT())
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_irq(IRQ_T=
T_MFP_SCSI, sh);
> + =C2=A0 =C2=A0 =C2=A0 scsi_unregister(atari_scsi_host);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (atari_dma_buffer)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atari_stram_fr=
ee(atari_dma_buffer);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
> @@ -828,7 +861,7 @@ int atari_scsi_bus_reset(Scsi_Cmnd *cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atari_turnon_i=
rq(IRQ_MFP_FSCSI);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> - =C2=A0 =C2=A0 =C2=A0 if ((rv & SCSI_RESET_ACTION) =3D=3D SCSI_RESET=
_SUCCESS)
> + =C2=A0 =C2=A0 =C2=A0 if (rv =3D=3D SUCCESS)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0falcon_release=
_lock_if_possible(hostdata);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return rv;
> --
> 1.5.6.5
>
>



--=20
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
