From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [RFT PATCH] amiga, atari floppy: Use one request queue per disk
Date: Mon, 22 Nov 2010 09:18:53 +1300
Message-ID: <AANLkTimOGz5L-SMRJ7J_oo4+Sdnp4wdeVzSi10qChNZ4@mail.gmail.com>
References: <1285271646-2768-1-git-send-email-vgoyal@redhat.com>
	<20100923223530.GA5658@redhat.com>
	<AANLkTiki5-2x2PDrsbEHYQGPDUix4ChyXiSpzt0YFy56@mail.gmail.com>
	<20100925114300.GB20016@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:56429 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754239Ab0KUUS4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 21 Nov 2010 15:18:56 -0500
Received: by wwa36 with SMTP id 36so6600148wwa.1
        for <linux-m68k@vger.kernel.org>; Sun, 21 Nov 2010 12:18:54 -0800 (PST)
In-Reply-To: <20100925114300.GB20016@redhat.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Vivek Goyal <vgoyal@redhat.com>
Cc: linux-m68k@vger.kernel.org

Hi Vivek,

finally tested your patch (after it had become available through git)
and I'm sorry to say the driver no longer works. No idea yet why that
is - this is the error from the block layer:

end_request: I/O error, dev fd0, sector 6400
Buffer I/O error on device fd0, logical block 800
end_request: I/O error, dev fd0, sector 6400
Buffer I/O error on device fd0, logical block 800

Is that the correct sector number for trying to mount a FAT disk?

I'll go back through git history next to see when it first broke.

Cheers,

  MIchael


On Sat, Sep 25, 2010 at 11:43 PM, Vivek Goyal <vgoyal@redhat.com> wrote=
:
> On Sat, Sep 25, 2010 at 11:18:05AM +0200, Michael Schmitz wrote:
>> Hi,
>>
>> you seem to have dropped the patches from the resent mail - please
>> resend the patches in question to linux-m68k.
>>
>> Last time I checked ataflop (around a year ago) it was still working=
=2E
>> I will give your patch a bit of testing once I'm back from traveling
>> overseas.
>>
>> Cheers,
>
> Thanks a lot Michael. I am attaching the patch with this mail for ata=
flop.
>
> Alternatively, patches are also available in Jens's block tree here, =
in
> case you prefer to work with git directly.
>
> git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-2.6-block.g=
it
>
> As of now, patches are available in "for-next" branch.
>
> Vivek
>
> o Use one request queue per gendisk instead of sharing the queue.
>
> o Don't have hardware. No compile testing or run time testing done. C=
ompletely
> =A0untested.
>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
> =A0drivers/block/ataflop.c | =A0 50 +++++++++++++++++++++++++++++++++=
++++-----------
> =A01 file changed, 39 insertions(+), 11 deletions(-)
>
> Index: linux-2.6-block/drivers/block/ataflop.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6-block.orig/drivers/block/ataflop.c =A0 =A0 =A0 =A02010-=
09-21 15:56:35.000000000 -0400
> +++ linux-2.6-block/drivers/block/ataflop.c =A0 =A0 2010-09-23 16:12:=
35.826001335 -0400
> @@ -79,8 +79,8 @@
>
> =A0#undef DEBUG
>
> -static struct request_queue *floppy_queue;
> =A0static struct request *fd_request;
> +static int fdc_queue;
>
> =A0/* Disk types: DD, HD, ED */
> =A0static struct atari_disk_type {
> @@ -1391,6 +1391,29 @@ static void setup_req_params( int drive
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ReqTrack, ReqSector, (=
unsigned long)ReqData ));
> =A0}
>
> +/*
> + * Round-robin between our available drives, doing one request from =
each
> + */
> +static struct request *set_next_request(void)
> +{
> + =A0 =A0 =A0 struct request_queue *q;
> + =A0 =A0 =A0 int old_pos =3D fdc_queue;
> + =A0 =A0 =A0 struct request *rq;
> +
> + =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 q =3D unit[fdc_queue].disk->queue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (++fdc_queue =3D=3D FD_MAX_UNITS)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fdc_queue =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (q) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rq =3D blk_fetch_reques=
t(q);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rq)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 } while (fdc_queue !=3D old_pos);
> +
> + =A0 =A0 =A0 return rq;
> +}
> +
>
> =A0static void redo_fd_request(void)
> =A0{
> @@ -1405,7 +1428,7 @@ static void redo_fd_request(void)
>
> =A0repeat:
> =A0 =A0 =A0 =A0if (!fd_request) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fd_request =3D blk_fetch_request(floppy=
_queue);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fd_request =3D set_next_request();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!fd_request)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto the_end;
> =A0 =A0 =A0 =A0}
> @@ -1932,10 +1955,6 @@ static int __init atari_floppy_init (voi
> =A0 =A0 =A0 =A0PhysTrackBuffer =3D virt_to_phys(TrackBuffer);
> =A0 =A0 =A0 =A0BufferDrive =3D BufferSide =3D BufferTrack =3D -1;
>
> - =A0 =A0 =A0 floppy_queue =3D blk_init_queue(do_fd_request, &ataflop=
_lock);
> - =A0 =A0 =A0 if (!floppy_queue)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto Enomem;
> -
> =A0 =A0 =A0 =A0for (i =3D 0; i < FD_MAX_UNITS; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unit[i].track =3D -1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unit[i].flags =3D 0;
> @@ -1944,7 +1963,10 @@ static int __init atari_floppy_init (voi
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sprintf(unit[i].disk->disk_name, "fd%d=
", i);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unit[i].disk->fops =3D &floppy_fops;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unit[i].disk->private_data =3D &unit[i=
];
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unit[i].disk->queue =3D floppy_queue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unit[i].disk->queue =3D blk_init_queue(=
do_fd_request,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 &ataflop_lock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!unit[i].disk->queue)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto Enomem;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_capacity(unit[i].disk, MAX_DISK_SI=
ZE * 2);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0add_disk(unit[i].disk);
> =A0 =A0 =A0 =A0}
> @@ -1959,10 +1981,14 @@ static int __init atari_floppy_init (voi
>
> =A0 =A0 =A0 =A0return 0;
> =A0Enomem:
> - =A0 =A0 =A0 while (i--)
> + =A0 =A0 =A0 while (i--) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct request_queue *q =3D unit[i].dis=
k->queue;
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0put_disk(unit[i].disk);
> - =A0 =A0 =A0 if (floppy_queue)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 blk_cleanup_queue(floppy_queue);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (q)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 blk_cleanup_queue(q);
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0unregister_blkdev(FLOPPY_MAJOR, "fd");
> =A0 =A0 =A0 =A0return -ENOMEM;
> =A0}
> @@ -2011,12 +2037,14 @@ static void __exit atari_floppy_exit(voi
> =A0 =A0 =A0 =A0int i;
> =A0 =A0 =A0 =A0blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
> =A0 =A0 =A0 =A0for (i =3D 0; i < FD_MAX_UNITS; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct request_queue *q =3D unit[i].dis=
k->queue;
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0del_gendisk(unit[i].disk);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0put_disk(unit[i].disk);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 blk_cleanup_queue(q);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0unregister_blkdev(FLOPPY_MAJOR, "fd");
>
> - =A0 =A0 =A0 blk_cleanup_queue(floppy_queue);
> =A0 =A0 =A0 =A0del_timer_sync(&fd_timer);
> =A0 =A0 =A0 =A0atari_stram_free( DMABuffer );
> =A0}
>
>
