Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AE9139D
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817833; cv=none; b=oasGXb8UK8ED+5vVUHutDo+mbqEYvvUzNC0FxtYDMsiF8F3sWjJnxRkOoylEK7/qvIGL5TpM+RJZENJGDI0hLNrfdvNBQckTuJn2RuuNIllZEUNvXE39r0KGfiPGImlf/BL8EthjwJca+MLaeY9nfQVrYTGuYSSJihVe2GfM0jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817833; c=relaxed/simple;
	bh=Je9bITW08L36Bz0pxHDB1qgo+cym5J+dbQT/zT4Smjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/pNh4XRItCy9skCa4H7qNzOTuk3VK2CCPQfs5c6ClfuCfx7939XSIAulMmeafMY2G0ywDxs19UgzfYjlh5g8v8aHHlxSwTj1aJbKAqT/sXNsDrUDtkbAY0wZgs3ZFpuSl3EmPNCMOVRmzys+Pj64hA1tkMN/AK631ch8Dnxd8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso1221054e0c.3
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 05:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817829; x=1750422629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxzlOS9tHs9NS7oAaTwMEVcfewy83US2ln27KCZSgi8=;
        b=m+ZWjexsOpULMmhxc0wfZ8Tj1yc0rvbd6iW2jAdwb/zBpY13Rn4PaPgBsXoCGlczm6
         PFwGkeRwf+mn20QunqRFYIGCJmNNwc8COYihJLYtjs1puMAiVK0C2wzOUeON8KiyyMXe
         JVWLuEqapMPdbjVwEy19vWgnS0ggJaR5mouwvyyGJdfln5Ne+AbSL3JiNGkgeNHGJpBT
         MBL5zlF/Izx0QvgMqDxuAiw8SY985J32dMapzVg+mogop1+z7J6uVsBxVP0t5fCSuh0t
         GWRDKEaBSghIEdYzB5qIq51jTNcClZLd5LphVRW2fzMUTli8Wz2Zm8/LcNTUMYBPxCqJ
         d7LA==
X-Forwarded-Encrypted: i=1; AJvYcCUkFWFZ2jKPEu54sqq5rFTHYjcrNGjIA/t/YGRtcAZ4j9Ysnq1H5P4bZdONVECHV82Pes8+QXRr2lDj@vger.kernel.org
X-Gm-Message-State: AOJu0YxhEVfwEeuwGGguLczVhec8h/l42zzroqrGsYsN5qbCdisV7+88
	SQA6Kxid4eCDtHJy69hNn4u85emtxcximrgQ2Q62ZUnalvxU/YUweC4lzucQZh+l
X-Gm-Gg: ASbGncv/eSYIsaYVFpC8FKEuClmDrwBbZRF9Yv6AyNWlAtUUhVkB9RQdnpiTLl94oFB
	uxr5eFtwrA/MFt/al8yTnMVmqiZsWeySGes+9aGMKabwMbobSrA39Um7kiRwllDtpevp9ssI13O
	5mVkPYogdAC17zxupGkKE2uUyIaayVIrfaXXtNDgyHHoprc+pXNLs4b7tNGfyxQVat45osSOZ3E
	XVIicRxtvwArQQpTHVIexa3Vk+0Pe4aYjuTy/4giT6f6fWLJvyFAgXmQlFBRmCVtu7x66iHVZWf
	Km2fg9Zko1J0JHV4qMDz2h6Cl1t6UFuGo8BukAtIbTudbBEExSnw+NAvoiCd2VMIKW/O3WXzghn
	FfsNrF8chUH182D61EcI5gfE6
X-Google-Smtp-Source: AGHT+IGHf836pRBTzGgTtaAfMbn/nwBkNBGQRUTZuBl7qK4bTBQ2twiBmIotw6pFzuJZyRccDTAEsw==
X-Received: by 2002:a05:6122:4f8e:b0:530:2c65:5bb9 with SMTP id 71dfb90a1353d-5313cb75b61mr1768931e0c.8.1749817829061;
        Fri, 13 Jun 2025 05:30:29 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313de140f9sm204291e0c.21.2025.06.13.05.30.28
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:30:28 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87f04817bf6so1345868241.0
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 05:30:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWm4wSCS7QbogE2Le/fOK37cleXhXj8gWhA6C0iEwJTVdqwGbPwZIDIBr8DDmw+UVJN5yK0Tj9Ls9P1@vger.kernel.org
X-Received: by 2002:a05:6102:3e16:b0:4e6:f3fa:bb14 with SMTP id
 ada2fe7eead31-4e7e398e966mr2018241137.12.1749817828277; Fri, 13 Jun 2025
 05:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org> <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com> <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
In-Reply-To: <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jun 2025 14:30:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
X-Gm-Features: AX0GCFtIIOcs_YW6L8g9x7AGvpPlP3h3kpwQ3zc4h0DtCn2xM4C1Dn-N-IuoAa4
Message-ID: <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Fri, 13 Jun 2025 at 14:23, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Fri, 2025-06-13 at 14:09 +0200, Geert Uytterhoeven wrote:
> > You are completely ignoring the last sentence I wrote...
>
> Because I am *extremely* tired of people heckling this discussion without *helping* me.
>
> I have had multiple moments where I thought to just throw this all into the bin, turn
> off the buildds and deleting the m68k archives because it's really hurting my sanity.
>
> I am fully aware that this change breaks the existing ABI. However, as I explained before,
> changing the default alignment to 4 bytes is the *only* way to keep this port alive in the
> long term and anyone who is interested in this port should either agree with me or present
> a suitable alternative to me. The latter still has not happened yet.

> > > >  What you do in the layers
> > > > above (in the kernel), or above (in userspace) is something different...

So you change the default alignment, bump all so-versions in userspace,
but keep the kernel-userspace ABI the same by adding explicit alignment
tags where needed? Old binaries keep on working, new binaries join
the ecosystem of anything that still builds on 32-bit big-endian ;-)

Win-win?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
