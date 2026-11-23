Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795440552;
	b=ascMBOSbgNRSDOGRI8KgykNl++//onr+OIC+sAd8tSD7yyM6VQ9UZEQNhED2IyF46yP8
	 Cq8d9ca5aWyiLagUAo3oqCNyddgZTPg9FL34x863SeANaChwL/BBNM0sHyE3fYqHW+FwX
	 +mAjy97NrWXNA91GjEptpnTGce6otVDsVhxPK+F6Qa/uaT7ftVe+zd4jfTs4Zjjx6ay0O
	 dGZfSi/ccG07K0IztejMgBXkXt8Icrv4+4LpCfLHBf2Tk5hL2kM4G291bsJ1tES1L2aKk
	 Qu2YeSxRiICV5pycr808a4Q+gPRwlw23Mmephe8wHvJ1LppJaiS3FKKd7JMzd7OpHGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
	b=2l8wNUaVGEsTmU+Tby+nLHmX/VyMLCJwzajxyc+sHj8/78Z8GZfHM5JehaZHgLDQcj6y
	 xSDpbwfijD+1vdS5MZiatfuaYg7o21R2xHndwCw8jNpRAzkBdL0Ab1N3aGi2dL1mGWuM7
	 4C0cJK+KevrNKtIWcrKZboxvQ7HgxmikmUgsA1UMUDJGQPNZik+W7LgAOAIfAbriRKmsk
	 tBu/9lubXP9hBWIS6W9tnBKvGYpATsbHsr7x59pS3HsAbyNgqGBAQTgZ76qjd2RbPk+8o
	 hRV5kE1iTp0XYozpd7a4rRYoQBAR2u+7mDHgyz8yhA5yLDMAE3oseowRqdKA6ds+ryA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E11fSI7K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49FC606A321
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 13:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E11fSI7K
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c0ace36e8eso233157e87.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 05:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795440550; cv=none;
        d=google.com; s=arc-20260327;
        b=MN9HbEqPlGQbJZQeQZ/F/S9cDG5P3K23DuHHLxE/9VFTgJzaeANI0HtSFYRWlLMOwM
         U2Ik/NZHrDPpDwP7vsCanOJ7QHaIrHJxQoZWtoxYthj5/5DFxzGLO3fDQRgaKLurhXsZ
         kIAusJt1jzy3FeFEHfpL6zYUDZ0b4CwiwSLJHTrA/M5nbaiK7HrL43L+ce4r3bnVZvAB
         kYUJ0YNlnk05cikdByv5qdMrVkRsHMlZL7oa+yHHK6Aw2BK7icABXobRIPnaIbsPGj9C
         aJgDtkXSFLFjuRkAvH31U2b8HrkfzHTh6NjK0R0KyJuUC2HAGKuoWg6WvvkDI+2WWqZa
         KLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
        fh=DpuXSjwM5BeHAVZX5jMb1178793j00aSdEdBvXl0oRY=;
        b=bj6tCCgYl25yy4tcrGC1JXb5t9mHDKX8YggXm2xCEruBoVUS6Sf/BpwUJoDjJGUmK1
         VVp3C6rvi56IoH0T67N0ZLRVL40KRWZer/XLhQjuTtBgOPkdXjvFXrld9mj2UPtKBNp1
         TAApprDez5jNLI5nAHpX8MePMz6vwDgUDX/IAS9e/E5+5NUANZ87QX9J2xQkNYkxHvEf
         /v1pWJBONU5nlrIPO5zopMDKMslhtaYcEv6RH8lSIK9ckRJoOm2l5tcWoYmjhMYqFAGZ
         4PGARsCyI/083gM0AjM/cb65LVJcbqOH53C2EUdy+mL8eDmMza8Y1UF48/HDYShtoMUf
         CG9w==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440550; x=1796045350; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
        b=E11fSI7KKY57lOCpEULrmQH62GZCI1+29DpA5wefoN6JVXKu3obtxS/3/1CzvCC+RN
         Q8XtA8SRcgU6pdiiJdekIppPdRka2raTrFQ4wuaXz9zlI80tFXn9FUHZdM/WzvbFe4TC
         kukfAdTsnFi3q2PeX5lPv6fN+sMngLZ/yerMNqJ7o5vw+hBDpNdFfne6i3wlOhNAH7C9
         ESRFUmRx8dgqxnIhbZL2lQT6ORD62bgmzuBaDY7rx1vrIdfc7EADVzsKqtO2OkaL7KeR
         1FM1Xxoii23UKLZfnQs6GkyxBrXW97zhIyCSh+eV/nySEHvx1ZnU8XXoYNl9NieKrHL5
         cKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440550; x=1796045350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
        b=MQLgpzwGN4ZgZ9vRnzKoJIy5wsruKGUPE8he8LgrWpGPZG7GcSwx3nuUp9hC3zAFYL
         aPsw8J/OHBtxFPNPMbYO3FOE90aZsvIRpX60lFsnIg4mIbBFHtj3NP1SBok5EE2bgfkC
         KUX/Ho3oxiHTtfEQD2TLZMniyok0U1T1Wa/ERh8a/yf5dn/4PxrMgxS+EO98fAnFiX8c
         3sgIaSp8rWsvTN7vieIldzDerKCq6RtZGyO3I/uENyZ4qopeWna8WuDRCTCpdYXUj52m
         37nUqJc7/+TVq4hjKCX+CVXOmrEJdwb2KdW3ST4jylxeBvsxwGXLUrVAMQNZSuhw3nOx
         CKyw==
X-Forwarded-Encrypted: i=1; AL+hErFuqZEkLJ/ItiQVFx8nvwBcPnrDItIPewOd8lG2bt3KXkKpUDwKZtJJwSo8+nh2pHRQmrdUjIggvqjd@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/k0rj8dgep0UarjhVNgHL2MGgflxZVoH7XZWEV0PP6Q+BoYaGw
	j3k58NOVxJCH9eJku4C+/OPOjSuulktK3BWtTpvnr/t9CZO3i47HIAu89WjndhdeRvMRut6gpf6
	6Ef2SLa/Wu1OIwYnvbAFi4lOkwPQQqto=
X-Gm-Gg: AZFdTZfxOGAD4UpjTuZ/RITQksWS2QFXoQN/UDU61qUkEp502LNSagNpGoSIzp6JJmV
	bktOKYQgxiytez1qL6Bv+CQq1R36BqFnsdzAKYj9axP0LBe2JOLsriZRmYwbbCLTJEwl/Xu7ijh
	wMufmjOCinEJFnZyogdM99XUI7KIsh+FZrl1wdQ29JBYS0VX38+Fowtn9Z0la8k4A4AHL34nW0J
	3B4S/vyD8W8LqBMKl+SyPWduDHxS8nk9ryPp2/kSmr/4R0DoO9D6V9+oiqNopxBz7yCpOzpwaPm
	I4rFfXXPCzaq9fFefPQ3JMWWU6nx9xoYGJotCbBxgq2XbHOpSaqEoQ08UHKRbRTwRBGe6ARzu1D
	Wu/qAQPg4i3LEHgvjQeTEJPixfbQaE86gRconCIm3xQpLo5F09wgjjkd1ZRfB3A0E8N4dj6QbIk
	OKU19zHi9A99bp2dHvTBX57lRSk4oRrrIAh1MNnUVSMbO+XPHf2pSEBY6uKrh68nSszUpHlk435
	vper2MeBDNERE5G+lRgAtRJtFbz2QDRs4La6HeLiJQtDRPYf9m73OVLmbVo1tKROFT8Lt+A
X-Received: by 2002:a05:6512:6718:b0:5c1:57b6:c731 with SMTP id
 2adb3069b0e04-5c1bc55528amr2860372e87.0.1795440549518; Mon, 23 Nov 2026
 05:29:09 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-2-0f6018be8dae@kernel.org> <sashiko-outbox-199744@kernel.org>
In-Reply-To: <sashiko-outbox-199744@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2026 14:28:57 +0100
X-Gm-Features: Aa3M54p2MuaVPrel21pLHhiv7_UQjxDcbruYJqUL7bjr4LeGvFh_ddwRm4qiHrQ
Message-ID: <CANiq72m57kFE5LTjT6V0Vajbwv_oPFEVwkBWgp5B2Xhh1E9uFg@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] kbuild: implement and use depcheck to check
 dependency timestamps
To: sashiko-reviews@lists.linux.dev
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> - [Medium] kbuild: missing fixdep prerequisite for depcheck in scripts/ba=
sic/Makefile
> - [Medium] kbuild: concurrent Makefile.build runs race on .depcheck.mk.tm=
p and .depcheck.mk

I have been using some of the patches of this series for something
else, and I have been hitting these two issues that Sashiko mentions.

For the first one, e.g. `olddefconfig` in a clean tree can give:

      HOSTCC  scripts/basic/depcheck
    /bin/sh: line 1: ./scripts/basic/fixdep: No such file or directory

The suggested prerequisite fixes it for me.

For the second one, e.g. `make -j4 rustdoc rusttest` runs two Make
instances on `rust/` in parallel. Most of the time one of them prints:

    rust/.depcheck.mk: No such file or directory

and sometimes the build fails:

    rust/.depcheck.mk:1: warning: NUL character seen; rest of line ignored
    [...]
    rust/.depcheck.mk:22: *** missing separator.  Stop.

I hope that helps!

Cheers,
Miguel
