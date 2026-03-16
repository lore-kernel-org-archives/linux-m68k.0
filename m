Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F336535A392
	for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Mar 2026 22:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698717; cv=pass; b=jh+AGSK9pPh08E7zi1wYpUgka1WdFVXLBWvNKd8+Qwnf8SKsjiehysLUbDmmTgLrcA2Juj2yLDD04tHZtzhw9qvihmJcpWfvMJXnkcTxYKVkzJiqXTSrLJp5mSmhGJJtXQEk6dMUppyoWmzUpPDoYkXHIxHkyUniDllZXDBxH08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698717; c=relaxed/simple;
	bh=Nf7AYnrioxynQ7VBNSCFWZ9m3bJw4GYd3gdeoIDa5L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evXC94zHJsEidFdArWUmAUnXvAEMEE0KGvMPl/goGr1xM+z8rj+vGr7740W9f6A7qFCWl91nKZnjYZhP5Bol/urMFWwPg7NVQHIAxrHkEQJPwZMZC3d8Uio4BaglkTSR5aZmKAZYHGwPmn/nlMngpr8qOwI3X2OaIGL26AKsSew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=hATRcES1; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="hATRcES1"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82a3d3235c9so1369664b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Mar 2026 15:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773698715; cv=none;
        d=google.com; s=arc-20240605;
        b=WpEiF/vT1jV7sC63zX8Ilvk62kldjcPkrEi1j0AUiIHxbvFESJvaQPcoSFBdCed4jR
         UugEGHjj49GX7TzzFluUg+KUTj9UtcXStDfRaNcin48CbFtG+z2c/aKXdnwTvdkk5R83
         9BQs5y8iP2wVHWuIYQQHQsYhJIM08stLvPfI3UxmY8SAm4jrg5IV0rM4lBYV/5NWT0rT
         nLOX7PZb/LQpi4Hn9zKRxzk+93kl7eLud7RAroSR7oaRvsTVD/cz/+6xXJVNbQI+BYh9
         5QyAjI4wU7RDrsjfZI0W4zuYbBgO6wy/F51TzIwTbcpDbiR3QOOqlMLZITdhPUZQGPTo
         dLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gPXCOSxswj5Wu41kCz4fvWvrzJiCjzxNclfPJLTOd5c=;
        fh=kyJd2KTiS/IuEEqBE/3tbV9LTh0tz4lrLhO4Jpg+oxE=;
        b=ZhKDvQ4cosZP50JWCm78Rn32QY7/OrcQ8FMrZVhrgvR6dCURVHfhAnbf1uEgbZ7wvl
         /keWYq6z4QRM49au0oBKihjGLYpcxCertKiauzOR0kVA5aA5/N9coCpPhpcv0n5V47Xm
         UiH87277aLQMGYId5Nafeuj4iILcTaHNK4Vm7C8QlQ1I5FiPNoYyE0xSrmcRRG9Shg3Y
         zTEYrgor7u2f6y4QMVXEir0FkXccekxZpGp1Gboqxq4mZsBnWki36lelSP8IhAhpbvjj
         eZaCtkbnA7nxEbgz2nKa7Qajh4LisCdN89+0T0UA8o2wM+iwOFksUPjG8kShhFlrRcgr
         u12g==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1773698715; x=1774303515; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gPXCOSxswj5Wu41kCz4fvWvrzJiCjzxNclfPJLTOd5c=;
        b=hATRcES1FnnWyZnemKYjVJRpjVUZObOg3QOaspvsImlto4ljpVmxDKKLJBm1qdh4Uv
         /zME9NWalPJKG/GqRKgH4lJ3DaV/kCDIXOSGKPJHBPJTd3n/M9sGei+aB9myKf/mLNHJ
         FwRd2dTXG4lotywq7OxowR/JwDpeEjpGiqdQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773698715; x=1774303515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPXCOSxswj5Wu41kCz4fvWvrzJiCjzxNclfPJLTOd5c=;
        b=KW27cUBrxWES6JfvI8GByBhM3/qzb1PzcKcfJl8d9/zln0qCUcMz9I66DByjNisqVb
         J97ZyL9OGd13fTRVBXtZckjF30ZB6oFQ/Vd9r0J5vs//5LFeTlytDaJ0wahSMnS0k4SA
         /F2M/SfVisBZIT8BE25iDxpJKLwzuxX+2tc1rImcVMv96OcyzqC9RAEywVBVUDKOda5h
         7nSuOPRXoknKPXsgebNcX/dwqF/LkEMn+L8dQxwHvN+U9QdQy/Dk2GsxHdpGCSc1Fcrs
         h/Z6cIYCkwasNhQ7ilG3XiBQHZgKiTAIZ0jYa2rkMJI1ua9E58oDSO38Ay/E6AhX7EQ5
         dH5A==
X-Forwarded-Encrypted: i=1; AJvYcCXim2oL1EyF/HL0ZmPEONNs/wA+fXVcmvej+mRvdTDoghN1pqd+1e76sIexGzbVl6MQqhf3r/QAwPJJ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxxHZtLPdDyUYSpXxsSBYkBJLrrT0Wsh3jmNSKY3N46KlMqQYM2
	5XF+SAPcxr25lirhKcM0ftDTE37Jo8EVb47y1waaW78okrNNkl8t50CR7bCnQOp1+6ixVkxHgkY
	AkZwd59pq6fApQrv/eUV4MpGA5byFA/5HbXjqrylkig==
X-Gm-Gg: ATEYQzwSoXJeGdUPTmjhgdjElHdxiM8VLb/3E9tm0K+GmiT3/mEsYZ0hHIIX8u9c2ip
	I0kntn4+opOBpzgNdGh3R1neQDc3MPLHA/sfYUQfEwp3/HEKWhJE8DOp8sul/KgRDgiyLYDAS6I
	vjXFiwe+foLKSDcEysjscj5OWxsdWFjSE0tM2I8T1UwfskykAhe0JgCvWMT4s7PqGYWP0HmDWV2
	OFmR7w/YsKsYBj/0Ltwr6x53sCA4Snyy0NIWzfAfsBTgxpLYB30SypkenG+1g4L4f7Vs58kTnhb
	H69lR4MhRxktfpyA8NeGYPxrcOAcFFpWVpoQE5M=
X-Received: by 2002:a05:6a00:1a15:b0:829:7692:cddc with SMTP id
 d2e1a72fcca58-82a1984e588mr9780629b3a.21.1773698715047; Mon, 16 Mar 2026
 15:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312115832.835968-1-daniel@0x0f.com> <10efa219-f7d7-4655-9a48-b4094bf97d47@linux-m68k.org>
In-Reply-To: <10efa219-f7d7-4655-9a48-b4094bf97d47@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 17 Mar 2026 07:05:03 +0900
X-Gm-Features: AaiRm51ToRXHzwwr9fQdzz5XZ0FR-UXjxgnkyI1QLAHB_LpixxPWw07wjZ6AcLs
Message-ID: <CAFr9PXnO7y=PUPELb78qA1nN+4qsYqmk036PqXPLogk+L3Sv+A@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix task info flags handling for 68000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: geert@linux-m68k.org, christoph.plattner@gmx.at, 
	linux-m68k@lists.linux-m68k.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Mon, 16 Mar 2026 at 23:08, Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> The comments from arch/m68k/include/asm/thread_info.h are this:
>
> /* entry.S relies on these definitions!
>   * bits 0-7 are tested at every exception exit
>   * bits 8-15 are also tested at syscall exit
>   */
>
> So looking at what check is in arch/m68k/coldfire/entry.S:
>
>      moveb   %a0@(TINFO_FLAGS+3),%d1 /* thread_info->flags (low 8 bits) */
>
> In arch/m68k/kernel/entry.S it looks to be doing basically the same thing:
>
>      moveb   %a1@(TINFO_FLAGS+3),%d0
>
> So they do really only check bits 0-7 here.
>
> If you code the check like that do you still get correct running behavior?

That seems to work. One thing I'm unsure about is this in the coldfire version:

Luser_return:
movel %sp,%d1 /* get thread_info pointer */
andl #-THREAD_SIZE,%d1 /* at base of kernel stack */
movel %d1,%a0
moveb %a0@(TINFO_FLAGS+3),%d1 /* thread_info->flags (low 8 bits) */

^^^^^^
So the bottom 8 bits are in d1

jne Lwork_to_do /* still work to do */

Lreturn:
RESTORE_USER

Lwork_to_do:
movel %a0@(TINFO_FLAGS),%d1 /* get thread_info->flags */

^^^^^^^
Now the whole value is loaded into d1 to do the bit test.. but the
value needed is already in d1 as we'll be testing bit 7?

move #0x2000,%sr /* enable intrs again */
btst #TIF_NEED_RESCHED,%d1
jne reschedule


Thanks,

Daniel
