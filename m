Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20618030
	for <linux-m68k@vger.kernel.org>; Mon, 12 Feb 2024 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707732850; cv=pass; b=MICyKQUoVqvvsEIYuLzjZXpE5nIEL9/wg/aeinJqDwMgrPAyOF7wPXmN9OzwF3DLCPaGJ84SsSk3o0pPup78AmIJDEyotwN2FKPHXrvyrwA4k4HktlBWSbg2gpxu4LRBLC3zcOBqElJkL2yS0Y/q2MXQVyADVdWpNiuYGIcYJOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707732850; c=relaxed/simple;
	bh=auJ5Raf4nrR7jMRo6YXPw7GwWC+VwmLC9HPp8mJYK4I=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Uwa9wzwATZRh9u8c3D5af8TDAd7EMMjOZ7C9zAhFQUNqiLtnvk26pMQWMfy3y4QcU/oTDmHOG6zeXicMspjvubPb58x0EfQ9iroheL0pdWUgmGEDSjCMeSJrys/NsgNonlF+47+a7i6wmaz8U6sG5s3IhARRRkzPsZtM5auL3SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu; spf=none smtp.mailfrom=fpond.eu; dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=CUTPTOgA; dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=BmY5ATBy; arc=pass smtp.client-ip=85.215.255.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fpond.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="CUTPTOgA";
	dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="BmY5ATBy"
ARC-Seal: i=1; a=rsa-sha256; t=1707732124; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Bqnlx6nyLzNQHTL46u6mG9nRvJ2eldbEz/mptnzQXj77iKbxMZz4zLa+jflDvcb/uP
    z08hDZ5QF0fRCeC2HCQD3cQiaXJNY4ur/E59KhzePB2EfA+7Bn1Esq2oVsD3qaX2yNB9
    ASLNILiyeswly/8+akrdXvoIcpol0/fdMlmVSMVJWWoWvvGEN5CCfatZelUfSGg3ddcj
    7V5u5twv+MpZQE9HPXyg1t67HqYkb2WeaijfAOuoSdPFtjDDclAoHU7AuvkwjlPooxXW
    Y5VxfcDzixnyjciSTHlZ0uzoAkCGurIChdAQB571dXGRnevafaJZXOwhdvRX2CW+lqLm
    Uh5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1707732124;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7C5l8fhhWXEqulnPAAcprupFA6jwXOqitjdUFG+tUi8=;
    b=Z86js2bEREWEu7pHI010UxPVIowYZNUqCBcCXbKVsuRkah7J/vUopvMpdI/obpXBG6
    Pdh/kvj7xPSikPhNsjcW4V91MBddUOxJoulwEfMknKCsj/b82iz0Z4jDQ5AfN4I96DDQ
    QWK31mkP1iFJnwzB7+TB2NRHp6lQMQ164zLGms9l6Im1IXb9YtSdJFhD9OudLcTTStYx
    qZtekW+g0r6AgkQM+PlAEzoZd85WXIXxj58FV6iSgY2nuJ5iQ42yzw0wj433+IW8CmNL
    1AaeWhowCMamLAAFneV4VFOojGRu8n2EPC7AchKOOBddu6FITyPuZTcgnlPWba2wwCuT
    dw1A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1707732123;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7C5l8fhhWXEqulnPAAcprupFA6jwXOqitjdUFG+tUi8=;
    b=CUTPTOgAmB3D9ahi/RAz2vxRGZAqmGInnCQBlyyJ83fH8B7YPuiabUibBNCGpkoZhT
    GFqFYeaTEi493ogjf9t60LDIyMMkrjT6/4O65/skSKcsT06OY6penyIbrCsfktYutuLw
    xDykZY3imNhp55rd5uc3iquwTCWfLEPWZjsuFo6uIwui15H/ddKPBpvIaYKL0SYY7xfG
    zb27g8G/QLGo+VCMd/xU9f8Lh7s5NRVI7u/L+SjdGR5jJb03LNgZEmwHbwNTPC1yzEdY
    UQMKF+fE7z10nPVNgR96vbgFFMxKYXpE729R5cozv519OcW6QvrBfJXjpN6Wbzfgf8II
    lgkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1707732123;
    s=strato-dkim-0003; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7C5l8fhhWXEqulnPAAcprupFA6jwXOqitjdUFG+tUi8=;
    b=BmY5ATBycWW11z+vJSWv4HJJgxFe9hVN9PlfCCKBUlevvfyvyluypGYWzUjTn6SyKO
    Lkvp2AeFO5chzNTkceAg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/83N2Y0="
Received: from ox-live-app103.back.ox.d0m.de
    by smtp-ox.front (RZmta 49.11.2 AUTH)
    with ESMTPSA id Z7ddde01CA236s5
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 12 Feb 2024 11:02:03 +0100 (CET)
Date: Mon, 12 Feb 2024 11:02:03 +0100 (CET)
From: Ulrich Hecht <uli@fpond.eu>
To: Finn Thain <fthain@linux-m68k.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@vger.kernel.org
Message-ID: <522961735.202648.1707732123771@webmail.strato.com>
In-Reply-To: <34d37f57-3146-8aa0-7828-2df2d1679ee4@linux-m68k.org>
References: <20240205023236.9325-1-schmitzmic@gmail.com>
 <20240205023236.9325-5-schmitzmic@gmail.com>
 <CAMuHMdUMwQSEwDQ3tsmChutY3P0VQUA0A8jg63NxfyrmxfKWXQ@mail.gmail.com>
 <401b6911-e6ed-3e9f-9dcc-d4f951c6beef@gmail.com>
 <1501038841.1120470.1707393238298@webmail.strato.com>
 <34d37f57-3146-8aa0-7828-2df2d1679ee4@linux-m68k.org>
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
X-Mailer: Open-Xchange Mailer v7.10.6-Rev59
X-Originating-Client: open-xchange-appsuite


> On 02/08/2024 11:51 PM CET Finn Thain <fthain@linux-m68k.org> wrote:
> Ulrich, I imagine that you would normally receive fixes via the 
> corresponding -stable trees. If Michael's series went into 
> stable/linux-4.19.y you could cherry-pick from there for your v4.4.y tree 
> and maybe avoid some merge conflicts that way.

That would work for me.

CU
Uli
