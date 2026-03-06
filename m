Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69733067F
	for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Mar 2026 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783427; cv=none; b=TPdgTTVTOuUtwSTSzZ5m4SilWJRG4BZw581bv1t0vPnEqGGEhZc7LIqvTUBwZYIC42HvJ5aGdgMwMO6NWA/UbX7FC3HPeLTmKWME+MKbLWgTKsit/+lyMlCcd8wT5j7M9D8HcHZB3UxMlp/jBheDaRtlDh5TfR1w2FJjK92HffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783427; c=relaxed/simple;
	bh=qPr9f8wJUBbpM15AItJrT80CkT+e6Ooho6OS2EGPne8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFlbaD51at0n2AAG3LoP3IJAiXTwgqXhnAY6Oc5yHH8JeId8hSWsHq1zhoYREu1ztAf/8DlTLYwIddiGsEY8VzbZVqgfMSnOKSAiA1zqiRR4ilQI7JyLNhkXnr1eM5Tanznn46b6DN8e/6DVNa7B7yD4cy/NSya6XMP07C8xBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56ae58f3fc6so2567181e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Mar 2026 23:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772783423; x=1773388223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdmJ/A9wGP7kK4ayvP1Zz7mkwsDpagK6Z7kLIkIirWg=;
        b=pw71g5K5p0Bo+yzW14ciXTL9YUkT60ze8Z1Udl2Q/cvkjRY87SOyvkzJ4pNOb8YA9p
         Qlf7X15IJ/HgoG63eBCRfXWcN28/fcYTWqGPuQsxcvr3lsQlEu2ieIRKTjbiZ827b11b
         p3EAKS9S7u5gwFoXaUu94wp5U5UnxkvPra8XT1IQg4W9eDnTSp959pzjEDkrklfgnPnn
         hHIv2l0rbvxLcswxZV8Cqc361koFpuOI2toSeRXLGBZEGGM3/x29MJY+39BVrjnM1Ljn
         RwUiTrxDbcsaNtv6hXsAtfok6paJ8BajYII9XfRw+E2B8KALmvxTD4UiYC8kIQvbwTkL
         H8iw==
X-Forwarded-Encrypted: i=1; AJvYcCULja1wSaSRIvuJVDNJxRR51xx/2XnQMFOfxjvcHrVoncCdp6JQTIvJUEVHohRKJcZRiQecJysgEifj@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy6wC2JopXr2RuAxjeN0Qa895jZcwwikYvzbLyaviFaPMNDaW3C
	GARMenA24OLBHxG+xNyT6S2dla4j1yxuYwurX//pc1XCJoXYg5TKXI82xkVH0yx+dwo=
X-Gm-Gg: ATEYQzwkT10TAau1XVqrI2IhYOEKPtHxoQ33q4KfG5V3C3suU+RjLeNKJaW/efk1djv
	3lhjOMhakEwxcgoIYaF3gECEIdIdsk4v7EJ6GzgqEva0qyL7QjzxO+BJ3CQG/zy3eHQszjvI7NK
	wa6UORTHE/rI9hbaTh/JyHDZcAVflJND/jbJpxj2X0wKLh3i6CMB1fJ05qzwMR+vjrr1sRcJ9Ib
	goTx57xa89P0xw/4Z/eVdCIwLEZDylTxAmJJ6oZspdPCo0NuVRlXeFc15Ctvh+J450yBb/XujuV
	+Kq6CuwKIgyzQlkpRtduGg6YisTmfN2eBAIxUrjpS8/m4lE+vQ2eMhRc7F5UHefYJc/BlfxUm53
	AMuy2Nbj4eDLJPUVP/zJcSE3sklLfPkGM8JC9lhGm0FUPA1oeA6LMyzOPwaIgk/YmkllnaUA14N
	N00zsUQisp1WZnXTAn4fQ5RKSLu4JIqppKJNYLV7ZYH8QIWJo9Rj0qZr77uved
X-Received: by 2002:a05:6122:921:b0:55b:7494:177b with SMTP id 71dfb90a1353d-56b07e1d9b8mr416354e0c.10.1772783423002;
        Thu, 05 Mar 2026 23:50:23 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b57ec19sm663856241.14.2026.03.05.23.50.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 23:50:22 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso1114703137.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Mar 2026 23:50:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwUXY+rCKzGHYQxvu0NMjEr1Y45lF4djU70PsxKfQBxSTWRYUwnWJnctq6FkXMtaaSRXgEx2r0csc9@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3e93:b0:5f5:320c:4d36 with SMTP id
 ada2fe7eead31-5ffe639be56mr466977137.40.1772783422016; Thu, 05 Mar 2026
 23:50:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <550e7d7bb8c2620ca4f6c9e809a4f853bdfa4c67.1772751689.git.fthain@linux-m68k.org>
In-Reply-To: <550e7d7bb8c2620ca4f6c9e809a4f853bdfa4c67.1772751689.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 08:50:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4=t5G8fz1ARO7oKA86RwZP6T6yNXm5D7JgVtdaq5Rqg@mail.gmail.com>
X-Gm-Features: AaiRm51Eai65t4yiWUxPJcGlzdgEeeKTw8A1C1uhETq0DlB2V8HcDd0zczrBKe4
Message-ID: <CAMuHMdV4=t5G8fz1ARO7oKA86RwZP6T6yNXm5D7JgVtdaq5Rqg@mail.gmail.com>
Subject: Re: [PATCH] scsi: qla2xxx: Remove problematic BUILD_BUG_ON() assertion
To: Finn Thain <fthain@linux-m68k.org>
Cc: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Tony Battersby <tonyb@cybernetics.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-m68k@lists.linux-m68k.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Fri, 6 Mar 2026 at 00:03, Finn Thain <fthain@linux-m68k.org> wrote:
> The LKP bot reported a build failure with CONFIG_COLDFIRE=y together with
> CONFIG_SCSI_QLA_FC=y, that's attributable to the BUILD_BUG_ON() in
> qlt_queue_unknown_atio().
>
> That function uses kzalloc() to obtain memory for the following struct,
> plus some extra bytes at the end.
>
> struct qla_tgt_sess_op {
>         struct scsi_qla_host *vha;
>         uint32_t chip_reset;
>         struct work_struct work;
>         struct list_head cmd_list;
>         bool aborted;
>         struct rsp_que *rsp;
>
>         struct atio_from_isp atio;
>         /* DO NOT ADD ANYTHING ELSE HERE - atio must be last member */
> };
>
> The location of the 'atio' member is subsequently used as the destination
> for a memcpy() that's expected to fill in the extra bytes beyond the end
> of the struct.
>
> That explains the loud warning in the comment above, which ought to be
> sufficient to prevent some newly-added member from accidentally getting
> clobbered. But, in case that warning was missed somehow, we also have the
> failing assertion,
>
> BUILD_BUG_ON(offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) !=
>              sizeof(*u));
>
> Unfortunately, this size assertion doesn't guarantee that 'atio' is the
> last member. Indeed, adding a zero-length array member at the end does
> not increase the struct size.
>
> Moreover, this assertion can fail even when 'atio' really is the last
> member, and that's what happened with commit e428b013d9df ("atomic:
> specify alignment for atomic_t and atomic64_t"), which added 2 bytes of
> harmless padding to the end of the struct.
>
> Remove the problematic assertion. The comments alone should be enough to
> prevent mistakes.
>
> Cc: Tony Battersby <tonyb@cybernetics.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-m68k@lists.linux-m68k.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603030747.VX0v4otS-lkp@intel.com/
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> ---
> I don't know of a good way to encode an invariant like "the last member of
> struct qla_tgt_sess_op is named atio" such that it might be statically
> checked. But perhaps there is a good way to do that (?)

Keeping the BUILD_BUG_ON(), but adding "__aligned(8);" to
the ratio member, as suggested by Arnd, would do that?

> There's no Fixes tag here because there's no need to backport.
> The BUILD_BUG_ON() comes from commit 091719c21d5a ("scsi: qla2xxx: target:
> Fix invalid memory access with big CDBs") which appeared in v6.19-rc1.
> The build failure first appeared in v7.0-rc1 with commit e428b013d9df
> ("atomic: specify alignment for atomic_t and atomic64_t").

I would add both in Fixes, just in case anyone ever wants to backport
e428b013d9df (which looks like a valid bugfix to me).

> --- a/drivers/scsi/qla2xxx/qla_target.c
> +++ b/drivers/scsi/qla2xxx/qla_target.c
> @@ -213,7 +213,6 @@ static void qlt_queue_unknown_atio(scsi_qla_host_t *vha,
>         unsigned int add_cdb_len = 0;
>
>         /* atio must be the last member of qla_tgt_sess_op for add_cdb_len */
> -       BUILD_BUG_ON(offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u));

Iff you remove the BUILD_BUG_ON(), you should remove the comment, too.

>
>         if (tgt->tgt_stop) {
>                 ql_dbg(ql_dbg_async, vha, 0x502c,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
