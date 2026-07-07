Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5561542A7B9
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jul 2026 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435112; cv=none; b=EbQU3sSh+OO1N3TQ2fpfJXF4hDNp7vTumqiLxleshxHCiOXAr6SZV3LfuWjYTQgB/2yKC6Ic+PXx7dDFVOPBwZW0xrrqmEOkEr2ZCBd71zmJp1KVLr8tfEQQ+SRT/33xRWptxd/gPxINDTwfzIBRBSkhNWnk9bW6MKgvq27wM+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435112; c=relaxed/simple;
	bh=dOu+R6Ou6hC8DtqgKnfmghOSm/cIKRgBB2eu/KY/txo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LtYZOM2epCtuDFDDHwmopqUV+QrEXYKA+kz2MQUgpufhm3A5tGO/OkMGMRJN4OtIRpCP28hLh2nAp33jYqQx7GEvol6m4w9iHAGxdb+iCo+9t229G6lK2B1l4XbUqzDp0B5P9jMzb2pi1QL+rxz8x4utundbZllhaXTG3dq//Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=oKQAu9/V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aTkuKzmk; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="oKQAu9/V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aTkuKzmk"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AAC5D1400068;
	Tue,  7 Jul 2026 10:38:30 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 07 Jul 2026 10:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783435110;
	 x=1783521510; bh=O/o+jhtKyqNPXRz5AWmbe5eGCk745anSsMpmf0vI9tg=; b=
	oKQAu9/VmsyrM3UGyO7Za94PL4nbDtJb4vkG7Az73SCCdoAta7qMV53ck5BA9YcJ
	lVWOCbue0T41D2EGs/dyoamjr1kRuyz8MccdN5V/ukQJhx0F7SCDlLSYgdGBzTls
	TRwUwUSxAEY+SRFqisupfIg/OJUXtWVSqQNNyHMtdPLtT0NxfVdNW370Fc4GnsX1
	3EWdPVs825/ValSu69IATBFn3TDBkUihoa2tJjB05rAprvj5QFsispKaijdDoOL/
	KUW8DISOL0/TAlef0W4Fnt84mqMBV2132VhzS52OHtaKBTIJHoE0PGFYyR18GyCE
	wNUMp/XG7g02R3Vn5zdFGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783435110; x=
	1783521510; bh=O/o+jhtKyqNPXRz5AWmbe5eGCk745anSsMpmf0vI9tg=; b=a
	TkuKzmkmqM4gK+nPfO5TUg0bOX8Om3d2IG8yWBCgRM1lPoi9sEXCyKQPxnYt3Lje
	Abr3/29v+/ri+l2rdjtxnNTbgOAuqq0FYJZNgHO45mxn8oe24DXPGAyTCrjejnPn
	iWFG6/N0zz2zm6DLZf/UjhcvXFz/1Ah7nfEf1Yu+CrHqv3oxLOaoalYRWnI1FRd2
	xbWSRXVYlAYg6WzsFKNzlymrCcEzpF+JxIHomWKQBDOD+a4nQu88rGToHvgOMeCk
	lx/cYGgxs35rIza40lR+Hh8j3DXdcuT8Cszt+nNJ+qtZxiLp3gCLGME1xoWUGTTo
	qtdqLez9ZQrUE+Z8OFJFQ==
X-ME-Sender: <xms:Zg9NaroBoeytbtxgO0O4ywB8QVeMnkwCobJZvxnquF3Lj9LZ5FGh1w>
    <xme:Zg9NagesIScLrvTnPOcIaVvCJ8O5vCojYSYsjF36WfTuCruYSJ3CSbJFLA0WNTnC8
    24K1kkXoJsQ1KGomPWmaJF3bw5BE1zNtFrHpElY8xV9QVNm5gXlCnH7>
X-ME-Proxy-Cause: dmFkZTG1gK/N3b43Oc2Ad/g+KiCVND0TZG2dj1BLw5rDD6djJ/CHGKSvzekWaYavdfpS9V
    rIcDx6YdAN/hqB30UvAG05D9Y88L6xsEHttUoaTikICmGrnWHYcBZeXfGZKgXgIiTgDUaP
    /hWx3x5R87yVhAk75pyn9dVOW6sPG6rKa3+qb36ePxbu98RhnLbHKDzve0ek9RzmCu+0L6
    o67kcjRlh5Vb0vk1aIAzPhZdArNqq8zWq7PE4ZfNbX6m7WWLSLfWlJ3Oa/IRpRL6yeho59
    xXGO8/MGJm1slxsA25TbUaFbJ8d77MxLhCuiXBuFFvKSJaP5jc+TKDMPlkTnhcx1FeAOKu
    TRKI+j2zE3iqrf0VULyL8xanIS8Q7lPAs1YhEyU8jEIG3/OC3N4i6Kgd5wWHHNe2dfrz8A
    0VYDmXukEoF8EJ0vNaTXDZbpFe3oNxsjzgicX+4ffgSKSX87NV9p4ZUdz5TFgLOSVZkAet
    t8hoG7rYMf1QIvXYnrBLe4bvOyseY1MtVmed874JgaXkdeQJkQrephpWNMe9FWbQXaNW6H
    wJ8uc7QGDsXnER+o3w7fmceZ0tTCiVsdKKHwy3wm8pMVxHoA+57QRuOCICQLEgZrYfpFmp
    dTTd2vAD7ihE6ahJVlef4LQ/LwLim78SIpgGZd4ReXZxTDO1VaD5R+0tEasA
X-ME-Proxy: <xmx:Zg9Nas05bFpqdBsPp0KMPDiHnNvbTbkaAdMBOB8E3-OfPaF6pn--lw>
    <xmx:Zg9NagAk-851sGKGxCXAkYmZtCrcLgprU9h-jmqIYVWTJtqcU_B59Q>
    <xmx:Zg9Nagecf0kwnjzPbW3HvDO0ZLl_OJxdcdwZ0gFUgNYEHaySJstMfg>
    <xmx:Zg9Nal76aNFhxvXW5ePLkRwmcRVpPWVcgBvL9VbHt533hUM7SAKFSw>
    <xmx:Zg9NauvuyoGO2Ft7zp00-jLraI1al-ix7zjybxgtALTOcO3p7sYKpcf2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4B664182007E; Tue,  7 Jul 2026 10:38:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ak0q067GEFdk
Date: Tue, 07 Jul 2026 16:38:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Ungerer" <gerg@kernel.org>, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, "Greg Ungerer" <gerg@linux-m68k.org>,
 "kernel test robot" <lkp@intel.com>
Message-Id: <7a1071bd-073e-489f-836d-fc9c737bdd0e@app.fastmail.com>
In-Reply-To: <20260707124124.2604211-1-gerg@kernel.org>
References: <20260707124124.2604211-1-gerg@kernel.org>
Subject: Re: [PATCH] m68k: coldfire: fix breakage of missed IO access updates
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 7, 2026, at 14:41, Greg Ungerer wrote:
> From: Greg Ungerer <gerg@linux-m68k.org>
>
> Commit e1f3a00670d1 ("m68k: coldfire: use ColdFire specifc IO access in
> SoC code") incorrectly updated a couple of local IO access uses. They
> use "read8" when they should be using the new "mcf_read8". Fix them.
>
> This causes compile time breakage for two specific SoC types, the ColdFire
> 5235 and 5282. They got missed in original testing due to not having
> any defconfigs for these specific parts.
>
> Fixes: e1f3a00670d1 ("m68k: coldfire: use ColdFire specifc IO access in 
> SoC code")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: 
> https://lore.kernel.org/oe-kbuild-all/202607040536.BiSGmESw-lkp@intel.com/
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
