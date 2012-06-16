From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/7] affs: stop setting bm_flags
Date: Sat, 16 Jun 2012 20:49:46 +0200
Message-ID: <CAMuHMdXW80+jyp3te+uG+=kE5sCs=wRgKzE4CXAZVe3xGdFpmw@mail.gmail.com>
References: <1338998217-5010-1-git-send-email-dedekind1@gmail.com>
	<1338998217-5010-2-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:32830 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752718Ab2FPSts convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 16 Jun 2012 14:49:48 -0400
In-Reply-To: <1338998217-5010-2-git-send-email-dedekind1@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Linux FS Maling List <linux-fsdevel@vger.kernel.org>, Linux Kernel Maling List <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Jun 6, 2012 at 5:56 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> AFFS stores values '1' and '2' in 'bm_flags', and I fail to see any l=
ogic when
> it prefers one or another. AFFS writes '1' only from '->put_super()',=
 while
> '->sync_fs()' and '->write_super()' store value '2'. =C2=A0So on the =
first glance,
> it looks like we want to have '1' if we unmount. =C2=A0However, this =
does not really
> happen in these cases:
> =C2=A01. superblock is written via 'write_super()' then we unmount;
> =C2=A02. we re-mount R/O, then unmount.
> which are quite typical.
>
> I could not find good documentation describing this field, except of =
one random
> piece of documentation in the internet which says that -1 means that =
the root
> block is valid, which is not consistent with what we have in the Linu=
x AFFS
> driver.

The book "Amiga Intern" (German version on the 'net, which is faster to=
 access
than the Dutch version somewhere in my attic ;-) agrees with this ("Die=
ses Flag
enth=C3=A4lt -1 (TRUE), wenn die Bit-Map der Diskette g=C3=BCltig ist")=
=2E

I checked some file systems I had lying around, and they all have 0xfff=
fffff in
bm_flag (byte offset 0x138 in the block at the middle of the file syste=
m).
At bit to my surprise, as I expected two of them (very old backups of f=
ile
systems) to have been written to from Linux at least once, but of cours=
e I can
be mistaken, and never have trusted Linux's affs with them ;-).
Mounting (copies of) them on Ubuntu and writing to them changes this fl=
ag to 1.

After digging in the affs sources, it seems we had this behavior since =
at least
2.0.29 (which is 1997 or so), so I think it's safe to assume it's been =
like that
forever.

> Jan Kara commented on this: "I have some vague recollection that on A=
miga
> boolean was usually encoded as: 0 =3D=3D false, ~0 =3D=3D -1 =3D=3D t=
rue. But it has been
> ages..."

include/exec/types.h:

#define TRUE            1
#define FALSE           0

However, include/dos/dos.h:

#define DOSTRUE (-1L)
#define DOSFALSE (0L)

So AmigaOS will probably always use 0xffffffff.

> Thus, my conclusion is that value of '1' is as good as value of '2' a=
nd we can
> just always use '2'. An Jan Kara suggested to go further: "generally =
bm_flags
> handling looks strange. If they are 0, we mount fs read only and thus=
 cannot
> change them. =C2=A0If they are !=3D 0, we write 2 there. So IMHO if y=
ou just removed
> bm_flags setting, nothing will really happen."

As no one ever complained, 1 or 2 or whatever non-zero value probably d=
oesn't
matter at all to AmigaOS.

> So this patch removes the bm_flags setting completely. This makes the=
 "clean"
> argument of the 'affs_commit_super()' function unneeded, so it is als=
o removed.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
> =C2=A0fs/affs/super.c | =C2=A0 =C2=A09 ++++-----
> =C2=A01 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/fs/affs/super.c b/fs/affs/super.c
> index 0782653..1d42e46 100644
> --- a/fs/affs/super.c
> +++ b/fs/affs/super.c
> @@ -25,13 +25,12 @@ static int affs_statfs(struct dentry *dentry, str=
uct kstatfs *buf);
> =C2=A0static int affs_remount (struct super_block *sb, int *flags, ch=
ar *data);
>
> =C2=A0static void
> -affs_commit_super(struct super_block *sb, int wait, int clean)
> +affs_commit_super(struct super_block *sb, int wait)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct affs_sb_info *sbi =3D AFFS_SB(sb);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct buffer_head *bh =3D sbi->s_root_bh;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct affs_root_tail *tail =3D AFFS_ROOT_=
TAIL(sb, bh);
>
> - =C2=A0 =C2=A0 =C2=A0 tail->bm_flag =3D cpu_to_be32(clean);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0secs_to_datestamp(get_seconds(), &tail->di=
sk_change);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0affs_fix_checksum(sb, bh);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mark_buffer_dirty(bh);
> @@ -46,7 +45,7 @@ affs_put_super(struct super_block *sb)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug("AFFS: put_super()\n");
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(sb->s_flags & MS_RDONLY) && sb->s_di=
rt)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 affs_commit_super(=
sb, 1, 1);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 affs_commit_super(=
sb, 1);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(sbi->s_prefix);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0affs_free_bitmap(sb);
> @@ -60,7 +59,7 @@ affs_write_super(struct super_block *sb)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0lock_super(sb);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(sb->s_flags & MS_RDONLY))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 affs_commit_super(=
sb, 1, 2);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 affs_commit_super(=
sb, 1);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sb->s_dirt =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_super(sb);
>
> @@ -71,7 +70,7 @@ static int
> =C2=A0affs_sync_fs(struct super_block *sb, int wait)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0lock_super(sb);
> - =C2=A0 =C2=A0 =C2=A0 affs_commit_super(sb, wait, 2);
> + =C2=A0 =C2=A0 =C2=A0 affs_commit_super(sb, wait);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sb->s_dirt =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_super(sb);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> --
> 1.7.7.6

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
