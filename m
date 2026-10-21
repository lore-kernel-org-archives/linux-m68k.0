Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792567934;
	b=HwZZ579WN31O+R6l0vB3RheMasQEeyGknDfRVPaAuZiyygohb4qSkkD2DrRmc2d8HmLg
	 JxqGlRBARAZMRzCNY3BqxtNyKNuRbvXtKdcXKaaHVpWjdZVUUeLlbf0cdAdVrHc5hDF0R
	 e7wxrA+op7fLCJ7G6Xk4WBNzaGyB765jL3ScLjm/A6zhTW9lOTFE5FmGOHgKMPFdJZ5Ol
	 ORKAGvihJbvArdBnn41oeZE6MACD/6PxKvMPHrKG7/PCXmIvDCcXPZk/Q8lOsGVs9fh6A
	 lXKnMsnetwamX9C7IFjzFtmqKxuKeLxwcsQAhb8+vhbxvrf4fTvUJA9R1aDj0KQPzvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567934;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6QAiK2mo/o5kQv4IXUx/z21UDEdea17cHOw3H4USIDI=;
	b=GdoraQmBDmAm1i5uqMAlfnZkwnYgsohYAxVEoYo7Uu1+5rW7WoI9s2ev5p3+lCXs3rUS
	 DzTIh6hP8Lp4yQ1fjkJWRxDRCq8RHPHHR0fBL0Z85OyK0LnVTB7cYrzLCYypJoepdVwEW
	 kxSUZim6L79vXW6AMKpG0D0WLTae3YBH5KHJ94HOO5AmYkTqZXGn7gZ+Dit67zJyW6Zs9
	 uxy/8Oq1uj4i0gIN41YpJcEoxUFvLs3LAF2CRZ1fY4gTFVThuUnUobclkpN9XNslV5JJK
	 TspMh/rFFd326p+LxRMCwrtxiRqAwR4+tqy/dvalXsV+e5n03Mu9B61NnPtBRDuc1kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E792606A31B
	for <linux-m68k@vger.kernel.org>; Wed, 21 Oct 2026 07:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E792606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so114884e0c.0
        for <linux-m68k@vger.kernel.org>; Wed, 21 Oct 2026 00:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567933; x=1793172733;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6QAiK2mo/o5kQv4IXUx/z21UDEdea17cHOw3H4USIDI=;
        b=Xk59b7xEuRHLTNZcBj9B5AB+RZsPSFrXuECPWc6WxlyVhTIVqC+apFdDi/XvMxMHZn
         8zjgqNYfqTqnSU5yMcVovoxFJxvOFJA29Sykj1tGZOP1nxBQUF1hVrihaCB3bwPPYU5J
         NUw7BH563fGI8bKcONwnoX4uKcI7/LdGRlSarwIWhzIMBLEyZy3xSpz2VKz3DFRH40oJ
         ktP3ZJjLc8pSRTt5iZTRXlWA39dJoWJwc2BR+zG9WruhLEFBY0j1N5F+Syp9mOwR34PH
         Hct0NdIAMVGudM2AfMTsbZYnstpw7CUvVaqoypzzNFsNfV++AhoIx9zlmbSY6MltQaqN
         pCeg==
X-Forwarded-Encrypted: i=1; AKwUvBxMZR7PUyDpDCHpLKZ4dfsLodAclkFkkUilNYVLSo/zqJCEnVsqKUGD9UxRW/MBgMG9p+V+ZShmskjW@vger.kernel.org
X-Gm-Message-State: AFq9FYIOrjPqMSg6MrXQ0rgb++zQZV59cJV9tkgi5ip44oC6+Y+4xT87
	DBwJByU6fyCg/e6yJRWHB2QGfr+RhEA0WYVCi0qZ2qPc1E7YXn2Lb34vZzpLMzngOnw=
X-Gm-Gg: AYBFou16mOGXiZ+Pmv3jj+R5se/4Ij9Yi/H7oikpiyCtezb0pJRrl9sgvgxVsJH1g0O
	u4lSYysM+lLjpw/PJBqyhbFHywWPd4iposiuRZBe2zhvL9vc9AwTMLUXKHxDCT7vVbtYZDz5NrN
	FoaDShQ9DKJhWBnfSckI15QeDQbL2u5HZdC35HUN+4nO4mDCf8M6Fpx7051Ao6AUd95KDTB0j7V
	OiYyNRlB+hZU8+sBtfzE66aBHa94FiJcv7MCKVW8rKElna04/8T2DuFUjOQtzR/fMfX7r9w51RF
	5/p0pOLcfDWRuc97VyvKk1z3Pe3OVFdu0fwTyTUJp7o77BFNDgWrSF2/CURG3aqZWvhd3TygIxW
	w0B1GoGSPTcRYsQd/qdcBrxF5VzCL/oJ1WwazCizQt7rwEcS9mkmGXCJMMUo0tinLfLwoOI6Wes
	wb2rlPoIldVcMjnJ2el9v9sQaqXylW4TzYGe4Mr8CoO4IyNAN3ySkpRhuCXWxq2YHZVhmbz+qut
	uexm8c6CYWZUAre6NRzr4EZPzCXqlFhyQv2+jpGykmsODnJnj9LbFMEyJnXxvKdvCM5VTXEjNbr
	JNaseZNgEDQ0fGg7hQ==
X-Received: by 2002:a05:6122:3114:b0:5c9:a60d:3275 with SMTP id 71dfb90a1353d-5eaebd739fdmr400085e0c.9.1792567932932;
        Wed, 21 Oct 2026 00:32:12 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae98237b0sm2250859e0c.15.2026.10.21.00.32.12
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:32:12 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9906c85122cso100123241.0
        for <linux-m68k@vger.kernel.org>; Wed, 21 Oct 2026 00:32:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFeLhbHsiS8V5bNPLcm0ynRSaIRR3PRvOkJBlkIN8TUjKUkXo5hqn07ND3fOg0l3ILihh/myOFDmcR@vger.kernel.org
X-Received: by 2002:a05:6102:2c8d:b0:7cc:2152:4f95 with SMTP id
 ada2fe7eead31-7cc9246d45amr430597137.3.1792567932012; Wed, 21 Oct 2026
 00:32:12 -0700 (PDT)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021000338.2160223-1-miro.kropacek@gmail.com>
 <20261021022336.2232886-1-miro.kropacek@gmail.com> <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
In-Reply-To: <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Oct 2026 09:32:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>
X-Gm-Features: AclHuK-O5R44UqsZeHR5r5kV3Sh9TQiIGd4qHB-xb-ZK5hAF_St4Y5l-i_lJpFI
Message-ID: <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Miro Kropacek <miro.kropacek@gmail.com>, dmitry.torokhov@gmail.com, 
	linux-m68k@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 04:51, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 21.10.2026 um 15:23 schrieb Miro Kropacek:
> > Kernels are built with -funsigned-char since version 6.2, resulting in
> > the signed 8-bit position deltas reported by the IKBD being
> > misinterpreted as unsigned.
> >
> > The hook is handed a raw IKBD packet, so take it as a byte stream and
> > apply the sign to the two displacement values alone.
> >
> > Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
> > Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> > Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> > Cc: linux-input <linux-input@vger.kernel.org>
> > ---
> >
> > Changes in v5:
> >
> > - take the packet as u8 * and cast only the two displacement values,
> >   as suggested; this drops the call-site cast v4 needed, and with it
> >   the -Wpointer-sign warning
> > - add the types include atarikb.h now relies on
> >
> > The same cast of the two displacement values was tested on an Atari
> > Falcon030 with CT60 in v1 of this patch; v5 differs from it only in the
> > type of the hook argument.
> >
> > Michael's Reviewed-by from v3 is dropped, as the approach has changed
> > twice since.
>
> Dmitry's reasoning makes sense to me, so we're back on v1 with no change
> in functionality.

If it's just a byte stream, one might not bother doing s/char/u8/, as both
are the same type anyway... and then we're really back at v1.

> Looks good to me, feel free to add my Reviewed-by if it helps get this
> merged.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
for the arch/m68k files:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
