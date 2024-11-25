Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB3A19AD70
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Nov 2024 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732538241; cv=none; b=cgev/I6SJ53MrQd86zNqC06uzmTeqAXyLel4KtMV+bBWYSfyMFRC7OXZcjSNdJBs3LSrQXRHd1x7qyK7j3fuv/V7dZCgDXLmm6T8o9lQ5HvAu1UkKe3x8ZiSSmiERwPsfGYBk141CeTZin1RLB2a4FJIVyRDQ8hLSHas7rUlRDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732538241; c=relaxed/simple;
	bh=FXd94cOQtbf3ElQGJhsLavBZtZ3IdYaJXAS/35jCjWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmrqE6bypmElXuRyaxtEbPqYQlcvv4n6qvARZXzWTwrhXHYNHCd4o222WBy59mruW+JkhmGcgObITJIF6+5VCVYqg6Gi6b1gdcVwNffzQaDKMSXFWycgLEFbeysNk88RP1SxHucaNfRknUTOEUMYGcMIG/ed5RULn6+vNvCPhh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6eeb31b10ceso43567547b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Nov 2024 04:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732538237; x=1733143037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jDTUnR+iAlcoHbj6WgacjmHkCIwMIUy0wV0qU2IATk=;
        b=lZW+G3nabxd83UI2NqzPWNUfatfL7XJ+4KMb7QpA8z7iSVcs9ibEC6AR8qQnNyIGVL
         IziLXGjCbfo9hOcT7Cu6xARZ35FQnqak2q6KlGqMzbDhGO6HRaAQeIx/wIF0xVbYn1rK
         dyav4T248/Xb+mwBtY/1iXSDOGKE9dFJedi1gszjgVY6+VZ/j8dBdJfB3DB1uJDhH1lY
         JT2vvJNozqW8Sjev26C0Yqy/zlj+w89XZkkFvmCLbOrUgzaNwgTfxE0q9WeFM25itSEY
         Q2ie3JVSaKyGWS4JPE0Vz0mmNiJcaqJGqRFjuG5eUC88VxksnaeaZVjJYr+2KYWQ4/KR
         JIEA==
X-Forwarded-Encrypted: i=1; AJvYcCWQRLERtW5UgkYPXgkZ6ifmyywMh1XVxhRTVVr8gVlWLgDDZPKi2B63UWNjOsEktnjUCERqHD2YQ4L8@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyGwpZ9oqjy2qT/koHeR94j1WdafKGyfdHSPkQ6qnH3itDo5qgY
	HDMQxBSE71epYOe5imNebVo/rX5U+wolmTk6mox60ElYZRR6+t2b3vYI6d/L
X-Gm-Gg: ASbGnctQ7nEzBO0aTgXU2Nu9YTKusAv6SOhd0iKxty/BrZB1XGqm/J3INIX7dbcm29Z
	QylACys3jy0me4eWTHbYassXQiLMW4FL4tWjvwGgiPc238BX22ohFEHZLuTJ9MSkNJQ43oOHdJg
	XY7C3SQiN/e9+G070lk4thMUx9LjeRLqgU+Op7aJ25s8+2oNg8125ePyhM4Mij4yhFRZ8NYVVpL
	kncX2J4jeZhALSAJxs1U28LPRxWADKmiAXmI7o6YFWSRP4HsHB7s+lzUtYbPVNfd11cQEn4XR0O
	6o/Rgmf1EyPiTd4Y
X-Google-Smtp-Source: AGHT+IFGmDatuzOa/gbetQB2Hevp8IwqOn8u36UxI8I21/QtbGvRaNrDFf9Zso2oGr6UaJ3kXRZLKg==
X-Received: by 2002:a05:690c:4b8b:b0:6ee:4a62:609d with SMTP id 00721157ae682-6eee0a50cf6mr111304517b3.27.1732538236694;
        Mon, 25 Nov 2024 04:37:16 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eee8b7b571sm14815297b3.122.2024.11.25.04.37.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:37:16 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6eee6874ef8so26515717b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Nov 2024 04:37:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0oaMkDu7ftQ8/8EFB+1W5o79+nDuE07mukvodKTOxxHXyv+ZuEy1e+8Nfq9HkHNOP8XqUFStSwyqG@lists.linux-m68k.org
X-Received: by 2002:a05:690c:7084:b0:6ee:3f37:919c with SMTP id
 00721157ae682-6eee08d3f6dmr113218247b3.14.1732538236154; Mon, 25 Nov 2024
 04:37:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022151838.26f9925fb959.Ia80b55e934bbfc45ce0df42a3233d34b35508046@changeid>
In-Reply-To: <20241022151838.26f9925fb959.Ia80b55e934bbfc45ce0df42a3233d34b35508046@changeid>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Nov 2024 13:37:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWu_9-L2Te101w8hU7H_2yobJFPXSwwUmGHSJfaPWDKiQ@mail.gmail.com>
Message-ID: <CAMuHMdWu_9-L2Te101w8hU7H_2yobJFPXSwwUmGHSJfaPWDKiQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] debugfs: add small file operations for most files
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Johannes Berg <johannes.berg@intel.com>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

On Tue, Oct 22, 2024 at 3:19=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
> From: Johannes Berg <johannes.berg@intel.com>
>
> As struct file_operations is really big, but (most) debugfs
> files only use simple_open, read, write and perhaps seek, and
> don't need anything else, this wastes a lot of space for NULL
> pointers.
>
> Add a struct debugfs_short_fops and some bookkeeping code in
> debugfs so that users can use that with debugfs_create_file()
> using _Generic to figure out which function to use.
>
> Converting mac80211 to use it where possible saves quite a
> bit of space:
>
> 1010127  205064    1220 1216411  128f9b net/mac80211/mac80211.ko (before)
>  981199  205064    1220 1187483  121e9b net/mac80211/mac80211.ko (after)
> -------
>  -28928 =3D ~28KiB
>
> With a marginal space cost in debugfs:
>
>    8701     550      16    9267    2433 fs/debugfs/inode.o (before)
>   25233     325      32   25590    63f6 fs/debugfs/file.o  (before)
>    8914     558      16    9488    2510 fs/debugfs/inode.o (after)
>   25380     325      32   25737    6489 fs/debugfs/file.o  (after)
> ---------------
>    +360      +8
>
> (All on x86-64)
>
> A simple spatch suggests there are more than 300 instances,
> not even counting the ones hidden in macros like in mac80211,
> that could be trivially converted, for additional savings of
> about 240 bytes for each.
>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Thanks for your patch, which is now commit 8dc6d81c6b2acc43 ("debugfs:
add small file operations for most files") upstream.

> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c

> -struct dentry *debugfs_create_file(const char *name, umode_t mode,
> -                                  struct dentry *parent, void *data,
> -                                  const struct file_operations *fops)
> +struct dentry *debugfs_create_file_full(const char *name, umode_t mode,
> +                                       struct dentry *parent, void *data=
,
> +                                       const struct file_operations *fop=
s)
>  {
> +       if (WARN_ON((unsigned long)fops &
> +                   (DEBUGFS_FSDATA_IS_SHORT_FOPS_BIT |
> +                    DEBUGFS_FSDATA_IS_REAL_FOPS_BIT)))
> +               return ERR_PTR(-EINVAL);
>

This warning is triggered during boot on m68k:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at fs/debugfs/inode.c:457
debugfs_create_file_full+0x36/0x70
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted
6.12.0-atari-11072-gdeea1aa0a8f2 #1787
Stack from 0102fe78:
        0102fe78 0051acfd 0051acfd 00000000 00200188 005321b8 0042af36 0051=
acfd
        0002459c 00000000 005321b8 000001c9 00000009 00000000 005aff3c 0060=
f4d8
        00024644 005321b8 000001c9 00200188 00000009 00000000 00000000 0000=
00b8
        00000008 01020c00 00000000 0000209c 005f13e0 00000000 00000000 0102=
ff88
        00200188 005321b8 000001c9 00000009 00000000 005f13fa 005139e6 0000=
0124
        00000000 00000000 004370c2 000020f6 000000b8 00000008 01020c00 0003=
b03e
Call Trace: [<00200188>] debugfs_create_file_full+0x36/0x70
 [<0042af36>] dump_stack+0xc/0x10
 [<0002459c>] __warn+0x82/0xbc
 [<00024644>] warn_slowpath_fmt+0x6e/0xc4
 [<00200188>] debugfs_create_file_full+0x36/0x70
 [<0000209c>] do_one_initcall+0x0/0x198
 [<005f13e0>] tk_debug_sleep_time_init+0x0/0x22
 [<00200188>] debugfs_create_file_full+0x36/0x70
 [<005f13fa>] tk_debug_sleep_time_init+0x1a/0x22
 [<000020f6>] do_one_initcall+0x5a/0x198
 [<0003b03e>] parse_args+0x0/0x202
 [<0000209c>] do_one_initcall+0x0/0x198
 [<0041c948>] strcpy+0x0/0x1c
 [<00070007>] alarmtimer_suspend+0x6f/0x1fc
 [<005e9628>] kernel_init_freeable+0x140/0x198
 [<0041c948>] strcpy+0x0/0x1c
 [<005e9676>] kernel_init_freeable+0x18e/0x198
 [<005f13e0>] tk_debug_sleep_time_init+0x0/0x22
 [<0042b2d2>] kernel_init+0x0/0xf2
 [<0042b2e6>] kernel_init+0x14/0xf2
 [<0042b2d2>] kernel_init+0x0/0xf2
 [<00002524>] ret_from_kernel_thread+0xc/0x14

---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at fs/debugfs/inode.c:457
debugfs_create_file_full+0x36/0x70
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper Tainted: G        W
6.12.0-atari-11072-gdeea1aa0a8f2 #1787
Tainted: [W]=3DWARN
Stack from 0102fe70:
        0102fe70 0051acfd 0051acfd 00000000 00200188 005321b8 0042af36 0051=
acfd
        0002459c 00000000 005321b8 000001c9 00000009 00000000 005aff3c 0060=
f53c
        00024644 005321b8 000001c9 00200188 00000009 00000000 00000000 0000=
00b8
        00000008 01020c00 00000000 0000209c 002a44f0 0029c032 005b8a1a 0102=
ff88
        00200188 005321b8 000001c9 00000009 00000000 002a450e 00539121 0000=
0124
        00000000 00000000 00462a86 002a44f0 0060f53c 000020f6 000000b8 0000=
0008
Call Trace: [<00200188>] debugfs_create_file_full+0x36/0x70
 [<0042af36>] dump_stack+0xc/0x10
 [<0002459c>] __warn+0x82/0xbc
 [<00024644>] warn_slowpath_fmt+0x6e/0xc4
 [<00200188>] debugfs_create_file_full+0x36/0x70
 [<0000209c>] do_one_initcall+0x0/0x198
 [<002a44f0>] deferred_probe_initcall+0x0/0x8a
 [<0029c032>] _mix_pool_bytes+0x14/0x1a
 [<00200188>] debugfs_create_file_full+0x36/0x70
 [<002a450e>] deferred_probe_initcall+0x1e/0x8a
 [<002a44f0>] deferred_probe_initcall+0x0/0x8a
 [<000020f6>] do_one_initcall+0x5a/0x198
 [<0003b03e>] parse_args+0x0/0x202
 [<0000209c>] do_one_initcall+0x0/0x198
 [<0041c948>] strcpy+0x0/0x1c
 [<00070007>] alarmtimer_suspend+0x6f/0x1fc
 [<005e9628>] kernel_init_freeable+0x140/0x198
 [<0041c948>] strcpy+0x0/0x1c
 [<005e9676>] kernel_init_freeable+0x18e/0x198
 [<002a44f0>] deferred_probe_initcall+0x0/0x8a
 [<0042b2d2>] kernel_init+0x0/0xf2
 [<0042b2e6>] kernel_init+0x14/0xf2
 [<0042b2d2>] kernel_init+0x0/0xf2
 [<00002524>] ret_from_kernel_thread+0xc/0x14

---[ end trace 0000000000000000 ]---

> --- a/fs/debugfs/internal.h
> +++ b/fs/debugfs/internal.h
> @@ -18,6 +18,7 @@ extern const struct file_operations debugfs_full_proxy_=
file_operations;
>
>  struct debugfs_fsdata {
>         const struct file_operations *real_fops;
> +       const struct debugfs_short_fops *short_fops;
>         union {
>                 /* automount_fn is used when real_fops is NULL */
>                 debugfs_automount_t automount;
> @@ -39,6 +40,11 @@ struct debugfs_fsdata {
>   * pointer gets its lowest bit set.
>   */
>  #define DEBUGFS_FSDATA_IS_REAL_FOPS_BIT BIT(0)
> +/*
> + * A dentry's ->d_fsdata, when pointing to real fops, is with
> + * short fops instead of full fops.
> + */
> +#define DEBUGFS_FSDATA_IS_SHORT_FOPS_BIT BIT(1)

As the minimum alignment is 2 on m68k, you cannot use bit 1 in pointers
for your own private use.  See also the comment at
https://elixir.bootlin.com/linux/v6.12.1/source/include/linux/maple_tree.h#=
L44

Reverting commit 8dc6d81c6b2acc43 fixes the issue, and reduces the
atari_defconfig kernel size by 447 bytes, according to bloat-o-meter.

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
