Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62636F526
	for <linux-m68k@vger.kernel.org>; Thu,  8 Feb 2024 12:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.218
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707394333; cv=pass; b=u6sk/wVu0Pdx25komuTSbx01ji7RbFF9Lq0VzUFBt0ByDAG+u2Gc7q3JJFO1xcu2duMRWYHLK2cQ3Ra5aAirvW/Waukfye/2uIAAnIgRndAYbfT1fefmLSdvn5u5Lm80l1kkow1q3wahEDvC3SinoOMK1JB6z5ugeHrSXeWkqXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707394333; c=relaxed/simple;
	bh=oWrnIP4zty+xBdn/AZmj0+KZXZgHXUft22F0yn6r2CI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=FEmSMZlmQ/xbSxPkIZQsT/klRYSsYkmZzcYpNlldelUWQXaGYQes2j6+6GDBmO4s7xrbcHJLYXo+Yt07fdbBnIUUzC7ehsUtmyRD9MIahM1zTf6GlOb4phJ5DakKdQTdZUng8QksxRs6419h/9N11yX5t0XjbgUoAAjbZ5plYhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu; spf=none smtp.mailfrom=fpond.eu; dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=LfEDcWhp; dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=vWsouCU1; arc=pass smtp.client-ip=81.169.146.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fpond.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="LfEDcWhp";
	dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="vWsouCU1"
ARC-Seal: i=1; a=rsa-sha256; t=1707393238; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=c4v6rXzgD1ZY1SjjRa7i3g5c73R+uk5HVxqOiVYLtO0fK+qTXIzntNxayK+iX7CISk
    0CaYexDHhW0S/TR4lvp/ERPTScIx6m8+62U1IWPSKajrcUmU3vgWoqOrjPBhHIJz82/m
    +Qu8hlC3Pq+eY35uWsWelT5yperuFrs+wmYjedYzrO71cQ6/spMSbOkMgex5IuxtZmFc
    FnkoKW14q+4OIVtzjzaPqPWYc9vPvPWvuWD1xjM1O1idn/RD8ds0NMJZbHLOwjNq3XIz
    Zd6LNAYPXtmOVdwDzyXC2VOttRPG92KNTyIKQNIGCcWyA31QrPufY9ISaPY0s6vJu1Y0
    8whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1707393238;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=LPOIdbOx2qrygUlF2CHXP0NRsHqNVtWDETSh+qNes0s=;
    b=oDQ5r0i4ZRL+YIvRLvkuPQmTmLfJs7l/B/Qh6PhwKzLnIOmo871x8K+6j0q4BIpQxt
    PNYlKo/pKXkgsCaRiQ4lUSA+O2w73v6q1Q5sCJK2J3kA0NkFpmMXIPgr/yeWoDelF1Zq
    fFsaDj2aKx4PAA6qB8MIFO+xRyaHnYa/BE15BympPnfQOiZRcUvTfD+Ii0UEq3Wop2kR
    3pZ1Jg1ct4J9cFiFnNhA5rOhteKHSaXdaE16MyPGEt/AX2Fz4v9IXdK3jK99ne4XfufL
    w9rQIIackSK/qFTOt0yPT4iTyIRsyKltuklEqc6vHGy/6e79x39ogkYHc79WRc/gRm3J
    wM7w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1707393238;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=LPOIdbOx2qrygUlF2CHXP0NRsHqNVtWDETSh+qNes0s=;
    b=LfEDcWhpb4OeESOwj/RUk8pNGDyUlBkaVeb25qOMcRQEDeeWeVSwhLIX5JXPFpYTI4
    dGF7DQdECOc+DxVvTxtbVmMtzgoZbxqOVNm6ITg/SaNTMMyhdhLOuPRES7Arrx9PxDPX
    4sDS9V19yACyR66BC/j6nbbM2tQjFf67zy1taCYVp5H3ecMdSE99iD31Z3w8YGUAaKUt
    jaoPWxa45l+IUomTwmslRWZQGtW+jz+mVxbtVYgYG2fsFdrUEILJWvfXXXAR8WiC1tXI
    XX8WdSBKddRYWnZUNPcgRJX6Mg0tYiC9ePH/gKSMcaFrLHwq+uWcaAhiAz7HVzUwvKhG
    btEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1707393238;
    s=strato-dkim-0003; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=LPOIdbOx2qrygUlF2CHXP0NRsHqNVtWDETSh+qNes0s=;
    b=vWsouCU1HTriIpIyW0eC8AeNBt2hs6gRDlWsuw++pm71ijcp7+T6vp7MlpHhF7NvUz
    3TsfVtUfvwkup057QMCA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x64iFM="
Received: from ox-live-app403.back.ox.d0m.de
    by smtp-ox.front (RZmta 49.11.2 AUTH)
    with ESMTPSA id Z7ddde018Brww74
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 8 Feb 2024 12:53:58 +0100 (CET)
Date: Thu, 8 Feb 2024 12:53:58 +0100 (CET)
From: Ulrich Hecht <uli@fpond.eu>
To: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk
Message-ID: <1501038841.1120470.1707393238298@webmail.strato.com>
In-Reply-To: <401b6911-e6ed-3e9f-9dcc-d4f951c6beef@gmail.com>
References: <20240205023236.9325-1-schmitzmic@gmail.com>
 <20240205023236.9325-5-schmitzmic@gmail.com>
 <CAMuHMdUMwQSEwDQ3tsmChutY3P0VQUA0A8jg63NxfyrmxfKWXQ@mail.gmail.com>
 <401b6911-e6ed-3e9f-9dcc-d4f951c6beef@gmail.com>
Subject: Re: [PATCH RFC v2 4/8] m68k: Handle arrivals of multiple signals
 correctly
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev57
X-Originating-Client: open-xchange-appsuite


> On 02/05/2024 11:15 AM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
> On that note - Uli: would you prefer the entire backport series, or only 
> those you do not already have?

I'd prefer to only get what's missing.

CU
Uli
