Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C515E38AC7E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Jun 2026 02:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575324; cv=none; b=e4ak0SXPxaTC96YYU3nM7DPt6P/72GzcHv2sfQv+hkW/lqgFGU4yWx3bBkoBNmkSDJ6N5ViK6GsziWqaYXOQG8ZZZ6j8yhqzbhxFPbaIm+yS1WyvTlEoKP4xnbssmoJk8NAvXgL2ncNDd6k/UQZ3nUJPsAivq1tSVpTYAH1HwDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575324; c=relaxed/simple;
	bh=GuqXIH4/Mp464G7SngNzHsMa6/UILMPguBBa2NVHWZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jjhjuTImta1n7o433ZtZeUntSZeSqrcukzeWoKB7hBz/moA7FTipMBUBFsGeRKfYFsPIXGaQ+MpEzyKTuLEkrnP8KdF0Tq3UPD+kJIPD67w8BmMM4Z2PP7ZTWXmsOhDObVEHYaA1FckxK1IMc1QPF9rFzBHTpBzLm0Qe9nphXLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=UpBSQFlZ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="UpBSQFlZ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304d8362a58so2991652eec.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Jun 2026 19:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1781575322; x=1782180122; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij2ukDXcMwBNLXQ6jucFsqZ3k4ldmE3wNeTpnN4p5Zc=;
        b=UpBSQFlZdGS/3A1Knp4ifDDSZ5xWmJUo2WeZOpBm5n81eX/I1wz+mLS6jqXdD2utGz
         qkovHsCJflGFi1fth262aXqEtu0qmRROiAft2bwrQdUv0MO5ZuFFdSYHzJKzOEglj6EQ
         SM9jlXkfSm4LXyJkEHviHKWJgjw6jiPLFPIz7hxxQPUQbPdcf3lmgjI8XTF+AP7/XGdF
         B38xjRCol6RdFzp/pbUYmMZ+j1guRwuUb2g2fHoCC0kwB521JAfbvZf28cwS6+z4Hixt
         6GUy5yDiAeOYJ0HxySlR9V+lcggw6cpea1ANd4nUIqBumwW2g7PplbEp+4njORRIbGYq
         c5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781575322; x=1782180122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ij2ukDXcMwBNLXQ6jucFsqZ3k4ldmE3wNeTpnN4p5Zc=;
        b=YFcFLPRKyCjF1qdd+lhZZEPR1kXPqh9tVb8L60dRR8VAYoGH416j72uIw1qboAQ91R
         vnQKNXW8FjZTwUWH8bnl2mPj4xDVwnFH3V/l+L7q3YoGRDTdUiQ7YiewuFR9NBRcTKsC
         +w1601PtyVFg/JjMkblVtfRfq4XzpLUmAI+Qja02r/cDW0p7XdU1FxfrNosGpRFOeThL
         63Z7EXs/yBU8ZuLE1omD0UkYmumHsXZ4Ici4jW9efrwRvfBkuI29bzN3fdJ8dP+EvwVG
         Ppq7g6HwFh8Qp7J1eC/f6oa/2BpvMeHVa1STqm8hSgp1/Dpu5lzbAomSXDzdU1HNCm9B
         N/Xg==
X-Forwarded-Encrypted: i=1; AFNElJ9cXNVG9tvzBqSKTnn45j1AGscANGkdL/Hd8X6jNqqLHJ6NjGAxtnyOea22DXLtU1Yav3pIUu0mbZ2D@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyKfeXoSqbMt0OQw8/6o8k5d0CNeGVcVCBQ+gkGH7KY8RpxpcAv
	IzbcmJrm37bwdBMHxXz9XfkWplb28RPAcokwhKAGr0qGsakruIFYaNzrZsAQGGvdT0w=
X-Gm-Gg: Acq92OEqGSofcim3upTNBTOFTyoQQevJiJICZpdt9WaNvmurfshFXGBqndzhlibdZQL
	PC4ekUE0fPS/34/1mr0fnAT4NtRNmfzGTlcxfL327Fob9KXHg5SUgugGltj50QQb9XHSV5lZd7u
	M8djbGJFzhAip73FxGlBmw5XixlnAZEk8Y20ZNYZjl57GZ1DGRREcAPm5nH0x5XNl+vOzSnUrPF
	8kFOzBaJnR6dH39D6XT8P712HvlJfK117Ac0UqFm4ojGeG7Vr14hck/jLpQL8LgLkDsikshv5HM
	efGb3KU/tqTBahwswAoLW/3swMGyALmGTbJ7JLGboVkvqvccEaogGz/m/e3OKAU+bJMItDlg182
	B2sPai46Sf9amJ3x5+cOuL2ICdHENqqpbSg7Jt3v5YadVWGAJpChyBSW8SHifL+TCsweNxNtagY
	8UmFooCVFC8hWVghLmfnE3ljr8yn1Gk8wYH4BXfXUwXugmZvr4c1kt3H7i5j5rsSgV
X-Received: by 2002:a05:7300:691d:b0:2c9:ee15:a0ee with SMTP id 5a478bee46e88-30ba33dbf37mr1207167eec.12.1781575321794;
        Mon, 15 Jun 2026 19:02:01 -0700 (PDT)
Received: from phoenix.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm18324839eec.8.2026.06.15.19.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 19:02:01 -0700 (PDT)
Date: Mon, 15 Jun 2026 19:01:58 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 geert@linux-m68k.org, chleroy@kernel.org, npiggin@gmail.com,
 mpe@ellerman.id.au, maddy@linux.ibm.com, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
Message-ID: <20260615190158.55cbf94d@phoenix.local>
In-Reply-To: <20260615222935.947233-1-kuba@kernel.org>
References: <20260615222935.947233-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jun 2026 15:29:33 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> This tiny series moves appletalk out of tree, to:
> 
>   https://github.com/linux-netdev/mod-orphan
> 
> Core maintainainers are unable to keep up with the rate of security
> bug reports and fixes. Nobody seems to care about appletalk enough
> to review the patches.
> 
> As Eric pointed out Mac OS dropped AppleTalk over a decade ago.


Acked-by: Stephen Hemminger <stephen@networkplumber.org>
