From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: aranym bug, manifests as "ida_remove called for id=13" on recent kernels
Date: Sun, 10 Oct 2010 11:47:20 +0200
Message-ID: <AANLkTin4886D+-yo=zrf2Yj2R5NM9qdRkc3M9cG2rN_F@mail.gmail.com>
References: <20101007174948.GT19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:42202 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754303Ab0JJJrV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Oct 2010 05:47:21 -0400
In-Reply-To: <20101007174948.GT19804@ZenIV.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 7, 2010 at 19:49, Al Viro <viro@zeniv.linux.org.uk> wrote:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0I've spent quite a while hunting that crap=
 down; reverting VFS fix
> mentioned in original thread *does* get rid of the symptoms, but so d=
oes the
> patch below.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0What happens is this: if ->follow_link() (=
usually something like
> stat("/proc/2/fd", ...) done by pidof(8)) return ERR_PTR(-....), we r=
eturn
> to __do_follow_link() and do the following:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0*p =3D dentry->d_inode->i_op->follow_link(=
dentry, nd);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D PTR_ERR(*p);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_ERR(*p)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *s =3D nd=
_get_link(nd);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0error =3D __vfs_follow_link(nd, s);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (nd->l=
ast_type =3D=3D LAST_BIND) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0error =3D force_reval_path(&nd->path, nd);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (error)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path_put(&nd->path);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;
>
> We _should_ return non-zero value; IS_ERR(ERR_PTR(-n)) is 1 and
> PTR_ERR(ERR_PTR(n)) is -n. =C2=A0What happens instead is that this th=
ing
> actually returns 0. =C2=A0And no, it's not a miscompile. =C2=A0Patch =
below
> removes the symptoms of the bug, but only if both parts are present.
> I.e. *not* doing "report =3D 1" in proc_pid_follow_link() gives us
> visible breakage, despite the fact that report is initialized as
> 1 and nothing except proc_pid_follow_link() ever tries to assign
> anything to it. =C2=A0Seeing that fs/namei.c and fs/proc/base.c are
> compiled separately, we can exclude gcc problems.
>
> The cheapest way to reproduce is to boot with init=3D/bin/sh, then
> mount /proc and have stat("/proc/2/exe", &st) called; if stat()
> returns 0, we are fscked. =C2=A0The critical part is between return
> from proc_exe_link() (we'll leave it via if (!mm) return -ENOENT;)
> to return from __do_follow_link() -> do_follow_link() -> link_path_wa=
lk().

I booted 2.6.36-rc7-atari-00360-g0dd2e6a (my current private test kerne=
l) with
init=3D/bin/sh, mounted /proc, and tried

    for i in $(seq 1000); do stat /proc/2/exe; done

a few times, but I didn't see any ida_remove messages.
It cannot read the /proc/2/exe symlink, though.

This is on aranym-0.9.9-1 from Ubuntu/amd64.

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
