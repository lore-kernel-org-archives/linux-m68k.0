Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEC228B4FE
	for <linux-m68k@vger.kernel.org>; Tue,  6 Jan 2026 21:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767733894; cv=none; b=lAWsZSo6ciowqJFHQZCAqni1ESzIVWlWnquZFSa++vkyzGQyBSB8ulc4+AawZ08SkZ4iYJksLt5dez5ZUAc3ueBXszKY/BJOo5khRVo4H9gr+l70Nmiy8AG6dL/mwA2UsvL+mA6z/I50hmvbqr3TS5+gCiSWn6gQ3JJQXjHyIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767733894; c=relaxed/simple;
	bh=Dp+/WLbF1RAEtrOf5B71hUZEsvKudNOXsXqDigaPUME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rP3+BqFNAQpylEUaN20s5OFTbrdYJzjON7frWq7u9JY4LLhrb0x9eSJa9EWW6TUbQg1n+XneaVjTfGPLkg6HZNzUKyVpepAZGYpl/xrV2YGWxow9efy7nWEKdkqVxk8BKiQXPQRSDAXgVIWYiFvNR1qeDFo1ftymDjB4PjLaNFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88a2b99d8c5so11094936d6.1
        for <linux-m68k@vger.kernel.org>; Tue, 06 Jan 2026 13:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767733890; x=1768338690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3R0fyP8TGDLlrD758aYXMWd7xgC0lCYxFMVVzuUd11c=;
        b=hrTegs7jZlMK55noqLrb8AhgKWAKFd9qHfOniH2gTKW77SGRwnRVo79MN+zXOampQb
         jPpqCje8Vjaae9hYn1wZ2OXniGIgy7Q8MFh7J7jITWe8zl6PSuAs5oy00/RNOJ46//GV
         Q7C7m8y2Gz+O4z5C1Ib34aqqGQOLWW079Toqw0mOo8VoVZs545FJqSI8oZzoSwu7wol8
         oKSjK0uH7SQ59pEX+9ic8ntpa3sEaaErU+hm7riz2SxZ16m0NYBZFYL8uMMuNGR4oWbr
         u0g5DbUvhIqZlRmcSe8dA+a9PZA8EG7+nHdBYHUln9ITVjU06cBl1Wbx7RmQBCPIxNin
         71pA==
X-Forwarded-Encrypted: i=1; AJvYcCULSWEV8JY3IUG0gfZKN7WcCxM3T0qNOzVrVKz5u2iLTaDjkl6ev1M97fuXd25TsiDwt11oUybL8hmR@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVraLetZTR2gKtlfmKvUol9mAp3AeAjLkzdsg0TzqAC2ZuMIX
	wsp97t8xeQRM88EYEXENQjqRmvRsGlyTvZR3EydZPkH1SQFlstNPpzC8cKAwUBnz
X-Gm-Gg: AY/fxX5pUZbwQMPuyXlQxJDvTHgUr+WRC8XK7GHgL4ktHro7KXt1ma3gXyEr9H2JfES
	ZSVTIYGmpn9sm52TWhwhcOeJpMyZzNIPUoXGmln8IYZQvIu8TKxIk5ABZxCADX+z0zalhiPUbjt
	fFssrqy05cTrsIxc6riyoOq795vjyqybvkPZPtsMmd/JXmHKBG/QrdLF1JtHLmushzx0Q5hO+fk
	EUgvYiJxXtyBy1yNlywVAePkh9vYFSeDK7eNy+RSss9pzLjASayjIvVY6K/7rz76es9IcPD9PZs
	aNm/Kt7BpOEhEzVaeQDH+d5hDX8ZDnDji5qXMaoAdC0gQ06bqxiFZqJ0vZ3ovA0eHNIR3XU6DAM
	b7h/1zH0s0yX6tG8SZNMDVyJwNw9PQJ4/hWMxIdDjwDOZXJPZu4WP8+uC2PCazHAPX+x8JrPNOb
	sLsJQOrrmPvde4nJ/+JXlp46nzaYtgCEzYhOPEjerQSCJdk8iT
X-Google-Smtp-Source: AGHT+IFtC15xC73GvA4/7SPO5ngM1ua9i0Yk4IPAGViYe0N70nnWGtwrkPhR5rwMyPFfHYjEfEQaqw==
X-Received: by 2002:a05:6102:e11:b0:5df:ae62:fc25 with SMTP id ada2fe7eead31-5ec742f5dddmr1370490137.8.1767727929306;
        Tue, 06 Jan 2026 11:32:09 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772afecasm890794137.11.2026.01.06.11.32.08
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 11:32:09 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5e55bd6f5bbso772214137.0
        for <linux-m68k@vger.kernel.org>; Tue, 06 Jan 2026 11:32:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMFtaOUL2DgiBll1pgSpsuYhoMTwPqidNoo/hQJY+Wf0orp+1O+oN1CYPIgCBd4INb88KzJHv5/qrI@vger.kernel.org
X-Received: by 2002:a05:6102:cc7:b0:5dd:8992:e38d with SMTP id
 ada2fe7eead31-5ec742f1768mr1359058137.7.1767727928371; Tue, 06 Jan 2026
 11:32:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org> <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
 <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
 <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
 <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no> <9277b6ef0478bc6651c03b4220004a4c8a2e1cdb.camel@physik.fu-berlin.de>
 <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com>
In-Reply-To: <e01dfc6d-a45f-4d17-a27c-67f913dc614c@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 20:31:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWVwXq+PzW_K1Lkn3hCAZuL4ps2VPEng4tB4wuhT+oytA@mail.gmail.com>
X-Gm-Features: AQt7F2peZS1PQtbeur7emcg8b3LRSARMZUZ5sjXnYfWFRCqhay5FvdPlrY_cpws
Message-ID: <CAMuHMdWVwXq+PzW_K1Lkn3hCAZuL4ps2VPEng4tB4wuhT+oytA@mail.gmail.com>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
To: Arnd Bergmann <arnd@arndb.de>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, 
	"port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
	"debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, 
	"linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, 6 Jan 2026 at 16:38, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Jan 6, 2026, at 14:40, John Paul Adrian Glaubitz wrote:
> > On Tue, 2026-01-06 at 14:34 +0100, Kolbj=C3=B8rn Barmen wrote:
> >> On Mon, 16 Jun 2025, John Paul Adrian Glaubitz wrote:
> >>
> >> Does this patch exist somewhere? I ask because I am migrating to
> >> 32bit-aligned userland (https://www.gentoo.org/downloads/#m68k) and th=
e
> >> gcc provided fails building kernel, stopping at arch/m68k/kernel/signa=
l.c
> >
> > I haven't created that patch yet as my work on this effort is currently
> > paused. However, it should
> > be straight-forward to update the asserts in the kernel code.
> >
> > According to Geert, Arnd Bergmann made some changes to the kernel uapi
> > that would allow the kernel
> > to be built with either alignment. Not sure what the current state of
> > things is.
> >
> > Let's CC Arnd to find out.
>
> Hi Adrian,
>
> I have these patches in my work-in-progress tree, and I still
> plan to submit them upstream, but haven't made any progress on
> it since I talked to Geert about it last month.
>
> See below for my current working version against roughly v6.18,
> which replaces all the implicit padding in uapi header files
> with explicit padding.
>
> What I do here is a combination of changes:
>
>  - add -Werror=3Dpadded to the header checks to catch any
>    implicit padding on any architecture
>  - add __uapi_arch_pad8 for any 8-bit pad that is the
>    same on any architecture
>  - add __uapi_arch_pad16 for any 16-bit pad that is the
>    same on any architecture other than m68k
>  - add __uapi_arch_pad32 for any 32-bit pad for
>    padding between __u32 and __u64 on all architectures
>    that naturally align __u64
>  - add __uapi_arch_pad_long between __u32 and long
>    (or pointer) on 64-bit architectures
>  - a few more specialized macros for less common corner
>    cases
>  - annotate structures as __uapi_arch_align to force 16-bit
>    alignment on m68k and larger alignment elsewhere,
>    regardless of -malign-int
>
> I've tested this by running the header check on all
> architectures, and running the abigail tests to ensure
> the ABI is unmodified (abigail is currently broken on a
> few architectures).
>
> With all the patches applied, we get two benefits:
>  - m68k kernels have a consistent ABI with and without
>    -malign-int, so kernel and userspace can use
>    different setting here, and we can eventually change
>    the kernel to always use -malign-int
>  - Any new patches that introduce implicit padding in the
>    uapi headers break the build and get fixed before they
>    cause problems. Almost all the instances I've seen
>    are unintentional.
>
> I have started splitting up the change into individual
> commits that explain the padding, but it will take more
> work to get through the entire patch, plus any additional
> changes for review comments.
>
>
> The diffstat is
>
>  407 files changed, 2433 insertions(+), 754 deletions(-)
>
> and I think this touches around 1500 structures, though
> most files only have a single one.

Thanks, this seems to work fine for atari_defconfig, and generates
the exact same code as before.

However, m68k allmodconfig fails with:

    In file included from tools/include/nolibc/nolibc.h:97,
                     from tools/include/nolibc/stddef.h:8,
                     from ./usr/include/scsi/fc/fc_els.h:14,
                     from <command-line>:
    tools/include/nolibc/types.h:120:1: error: padding struct size to
alignment boundary with 1 bytes [-Werror=3Dpadded]
      120 | };
          | ^
    cc1: all warnings being treated as errors
    make[4]: *** [usr/include/Makefile:85:
usr/include/scsi/fc/fc_els.hdrtest] Error 1

This is due to struct linux_dirent64 in tools/include/nolibc/types.h.
The same definition in include/linux/dirent.h doesn't cause issues.

> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -6,7 +6,10 @@
>  #
>  # -std=3Dc90 (equivalent to -ansi) catches the violation of those.
>  # We cannot go as far as adding -Wpedantic since it emits too many warni=
ngs.
> -UAPI_CFLAGS :=3D -std=3Dc90 -Werror=3Dimplicit-function-declaration
> +UAPI_CFLAGS :=3D -std=3Dc90 -Werror=3Dimplicit-function-declaration -Wer=
ror=3Dpadded
> +
> +# when cross-compiling with a minimal toolchain, use nolibc headers
> +UAPI_CFLAGS +=3D -I$(srctree)/tools/include/nolibc/

Without the rest of the patch, this line on its own is already causing
various allmodconfig failures for me:

    In file included from /usr/m68k-linux-gnu/include/sys/socket.h:26,
                     from usr/include/linux/if.h:28,
                     from ./usr/include/linux/netfilter_bridge/ebtables.h:1=
7,
                     from <command-line>:
    /usr/m68k-linux-gnu/include/bits/types/struct_iovec.h:26:8: error:
redefinition of =E2=80=98struct iovec=E2=80=99
       26 | struct iovec
          |        ^~~~~
    In file included from tools/include/nolibc/sys/uio.h:15,
                     from tools/include/nolibc/nolibc.h:113,
                     from tools/include/nolibc/stddef.h:8,
                     from
/usr/m68k-linux-gnu/include/bits/types/struct_iovec.h:23:
    usr/include/linux/uio.h:17:8: note: originally defined here
       17 | struct iovec
          |        ^~~~~
    In file included from /usr/m68k-linux-gnu/include/sys/socket.h:33:
    /usr/m68k-linux-gnu/include/bits/socket.h:33:9: error: unknown
type name =E2=80=98__socklen_t=E2=80=99
       33 | typedef __socklen_t socklen_t;
          |         ^~~~~~~~~~~
      HDRTEST usr/include/linux/tc_act/tc_mirred.h
    make[4]: *** [usr/include/Makefile:85:
usr/include/linux/netfilter_bridge/ebtables.hdrtest] Error 1
      HDRTEST usr/include/linux/tc_act/tc_connmark.h

I guess that is due to having libc6-dev-m68k-cross installed.

Dropping this line made the linux_dirent64 issue go away, and revealed
a few more missing pieces, so here is a gmail-whitespace-damaged patch:

diff --git a/include/uapi/linux/xfrm.h b/include/uapi/linux/xfrm.h
index 70eece6aa30e9306..4c10f5402d77757d 100644
--- a/include/uapi/linux/xfrm.h
+++ b/include/uapi/linux/xfrm.h
@@ -27,7 +27,9 @@ struct xfrm_id {
        xfrm_address_t  daddr;
        __be32          spi;
        __u8            proto;
-};
+       __uapi_arch_pad8;
+       __uapi_arch_pad16;
+} __uapi_arch_align;

 struct xfrm_sec_ctx {
        __u8    ctx_doi;
@@ -255,6 +257,7 @@ struct xfrm_user_tmpl {
        __u8                    mode;
        __u8                    share;
        __u8                    optional;
+       __uapi_arch_pad8;
        __u32                   aalgos;
        __u32                   ealgos;
        __u32                   calgos;

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
