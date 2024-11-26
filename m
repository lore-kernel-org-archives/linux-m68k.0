Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BBE17C219
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Nov 2024 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732610339; cv=none; b=etP22sGES0T1d3r/njiZRitbwmeIMY54edDxwgnpFtEnFq6VLQ6Rv0RqjU7p25q5X4FCTXSQT4ALa6qV1AaMqMoJWZHZwxSlJRbXJLf31lEXyY8UFsCEbvtogyR7kusz9uWTDEifPCazKRgZdHd2csm0luBskXNhCJHXqThXr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732610339; c=relaxed/simple;
	bh=YUKKRY7A2nE2FhB3ESXaNOsgnyAfymvw5W7zwhIFgMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUBqDN/JIUbiJrXdXk0kqDpqexrq8kxpoe0/IDN9UMD5tRnOI5aB/MjTY/Rgy1eRK3YYbkJJqK69JrtJe7yVaRW47MzFUkp+U5DHSjwDuwNtvy2/8CzSwkY/hBcoeeI7MFBZd/MlTw5pW9N0MbUA+WIver5kwjYKo7QmEZA7Ktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e333af0f528so4793848276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Nov 2024 00:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732610336; x=1733215136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjBErQLBEug3e9Mj9PlNyLOsB+0cCc+2zRG7fLFw9Bk=;
        b=dtBfZC6kSJNmxGCgTQRepaU7aG40YQaFgiej8Uyv74yWHG/MNpYnz44Jhgq3VUoJ2S
         /MtHBJ2EdGpQz2QyZR1lEjSj4k6lGpCwJc+3pX6Z1t5n8SVBBMQ2rFodCoyEKZcpjJqq
         ZOXNytbaifoUBke/okF7B+jbeRzOQN13A3NIaXT/JEATg2zKibuF8VelVuniNudHJI3M
         KShmKsx7AcF1mR8naRqquTqq+DKfEB/vYQZqd+NgEfQD3h4apTbljBAeSubGu2kOgccK
         4EffsGiucpLNqGqo/YRASUozmGah10Lp00+YHwoqt6utzjJhW35gFBlvpbzeCssNU2ml
         eKYw==
X-Forwarded-Encrypted: i=1; AJvYcCUsIB0zL15zn80j4nA2VpeKik6de08igfqFz40umuvx07l/CSS4KCmdgjE5PXFpjYBIG1/ApJl9Gcqt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyK7siLFYziHlhtc4GeKQ2utE1FU2LkalEpmbFbOZMr5y4FakgC
	FByfnz4+rnLJmtjhtuwblEaWtvvHiDfkFK62zZm/qGErUlo/o35FWQUU7DX5
X-Gm-Gg: ASbGncvl+c7LK36SQpDm3yPv8jxZSdGxOsiJY88wz7XKVmxCtVrTKU022E0zcW4R56j
	zy72ElqUEBAStT+Rjt+tOCegDxJgWHNyKpfqLuLdtonexEpZPVHxz2db9gJLcPf5pdCsyrsBj2m
	ynmyxRIcPVj/mYIZIFLwltV6VgPVjZXEmTLqpKwzrfD+OfjJ4RDBySlY/XSrLBQ/YDZmT6j5Kur
	BBGi85nxnW/0PuhfCD3pFYFzprc5dMldQKU20M/Wle0A4pxVBfQq+4JQVTdlz/wwH+O1u3/Q9j7
	dnXKvDHJWgiqorfl
X-Google-Smtp-Source: AGHT+IHoF85lIW94y2w0z4RtKco0NbKrsz29I/02y/6XjJodP3QK71SgbiqS+SXLtdNnU5tgkO36Zw==
X-Received: by 2002:a05:6902:110c:b0:e38:8042:460b with SMTP id 3f1490d57ef6-e38f8b0a5c1mr15329259276.13.1732610335867;
        Tue, 26 Nov 2024 00:38:55 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f5e5b218sm2962528276.0.2024.11.26.00.38.55
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 00:38:55 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6eee6874ef8so38102807b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Nov 2024 00:38:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPRPoA54I4c/FSUvEsUU/EX8GmBccOwqKWNK3urCpsBk/sUnDgSlp1Vcjobuasgns0baSGhu4JH52f@lists.linux-m68k.org
X-Received: by 2002:a05:690c:62ca:b0:6ee:b43b:62f4 with SMTP id
 00721157ae682-6eee09e9dc5mr153772817b3.19.1732610335371; Tue, 26 Nov 2024
 00:38:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022151838.26f9925fb959.Ia80b55e934bbfc45ce0df42a3233d34b35508046@changeid>
 <CAMuHMdWu_9-L2Te101w8hU7H_2yobJFPXSwwUmGHSJfaPWDKiQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWu_9-L2Te101w8hU7H_2yobJFPXSwwUmGHSJfaPWDKiQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Nov 2024 09:38:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbnZc7rYc7ibRNWY6EfRLh-7g0yDeZ3Zk5OXCQ9Cr=cA@mail.gmail.com>
Message-ID: <CAMuHMdXbnZc7rYc7ibRNWY6EfRLh-7g0yDeZ3Zk5OXCQ9Cr=cA@mail.gmail.com>
Subject: Re: [PATCH 1/2] debugfs: add small file operations for most files
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Johannes Berg <johannes.berg@intel.com>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

On Mon, Nov 25, 2024 at 1:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Tue, Oct 22, 2024 at 3:19=E2=80=AFPM Johannes Berg <johannes@sipsoluti=
ons.net> wrote:
> > From: Johannes Berg <johannes.berg@intel.com>
> >
> > As struct file_operations is really big, but (most) debugfs
> > files only use simple_open, read, write and perhaps seek, and
> > don't need anything else, this wastes a lot of space for NULL
> > pointers.
> >
> > Add a struct debugfs_short_fops and some bookkeeping code in
> > debugfs so that users can use that with debugfs_create_file()
> > using _Generic to figure out which function to use.
> >
> > Converting mac80211 to use it where possible saves quite a
> > bit of space:
> >
> > 1010127  205064    1220 1216411  128f9b net/mac80211/mac80211.ko (befor=
e)
> >  981199  205064    1220 1187483  121e9b net/mac80211/mac80211.ko (after=
)
> > -------
> >  -28928 =3D ~28KiB
> >
> > With a marginal space cost in debugfs:
> >
> >    8701     550      16    9267    2433 fs/debugfs/inode.o (before)
> >   25233     325      32   25590    63f6 fs/debugfs/file.o  (before)
> >    8914     558      16    9488    2510 fs/debugfs/inode.o (after)
> >   25380     325      32   25737    6489 fs/debugfs/file.o  (after)
> > ---------------
> >    +360      +8
> >
> > (All on x86-64)
> >
> > A simple spatch suggests there are more than 300 instances,
> > not even counting the ones hidden in macros like in mac80211,
> > that could be trivially converted, for additional savings of
> > about 240 bytes for each.
> >
> > Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>
> Thanks for your patch, which is now commit 8dc6d81c6b2acc43 ("debugfs:
> add small file operations for most files") upstream.
>
> > --- a/fs/debugfs/inode.c
> > +++ b/fs/debugfs/inode.c
>
> > -struct dentry *debugfs_create_file(const char *name, umode_t mode,
> > -                                  struct dentry *parent, void *data,
> > -                                  const struct file_operations *fops)
> > +struct dentry *debugfs_create_file_full(const char *name, umode_t mode=
,
> > +                                       struct dentry *parent, void *da=
ta,
> > +                                       const struct file_operations *f=
ops)
> >  {
> > +       if (WARN_ON((unsigned long)fops &
> > +                   (DEBUGFS_FSDATA_IS_SHORT_FOPS_BIT |
> > +                    DEBUGFS_FSDATA_IS_REAL_FOPS_BIT)))
> > +               return ERR_PTR(-EINVAL);
> >
>
> This warning is triggered during boot on m68k:
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at fs/debugfs/inode.c:457

> > --- a/fs/debugfs/internal.h
> > +++ b/fs/debugfs/internal.h
> > @@ -18,6 +18,7 @@ extern const struct file_operations debugfs_full_prox=
y_file_operations;
> >
> >  struct debugfs_fsdata {
> >         const struct file_operations *real_fops;
> > +       const struct debugfs_short_fops *short_fops;
> >         union {
> >                 /* automount_fn is used when real_fops is NULL */
> >                 debugfs_automount_t automount;
> > @@ -39,6 +40,11 @@ struct debugfs_fsdata {
> >   * pointer gets its lowest bit set.
> >   */
> >  #define DEBUGFS_FSDATA_IS_REAL_FOPS_BIT BIT(0)
> > +/*
> > + * A dentry's ->d_fsdata, when pointing to real fops, is with
> > + * short fops instead of full fops.
> > + */
> > +#define DEBUGFS_FSDATA_IS_SHORT_FOPS_BIT BIT(1)
>
> As the minimum alignment is 2 on m68k, you cannot use bit 1 in pointers
> for your own private use.  See also the comment at
> https://elixir.bootlin.com/linux/v6.12.1/source/include/linux/maple_tree.=
h#L44

If you want to support truncated debugfs_fops structures, I am
afraid there is no other option than storing a flag, structure type,
or structure size inside the structure. The latter would allow us
to support not just full and short structures, but also arbitrary
truncation, given even more opportunities for size reduction.

E.g. something like

    #define get_method(_ops, _op, _op_fallback) \
            ((_ops->size > offsetof(struct debugfs_fops, _op)) ?
_ops->_op : _op_fallback)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
