Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B8441619;
	Thu, 24 Sep 2026 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249553; cv=none; b=aiLpcjP3ZOMXxQ6vm1tIPl0tuEzVBDisVqMnmp0WTOPQBANcG/Xem45xUe3bCwdgrp23NiFlfNnsn2WBgzMqM3o+xXEwx1q4qylfLaUA3KIQQwI7NuVNfg+Chpvyo3jxAFzWDzPlknAZv868/yACU/3Ol58TzURTklxyaqyhWCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249553; c=relaxed/simple;
	bh=IGtxRpcF9t+HVtoKpmp0POloTfoviBsmRBGRMcjCW90=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cvzP6k0CzRHB8OQU82QlSl6gSCumCZ2ID3Yip9EcfZyydhY+CGPVcugDLRF9JV6ZGCXHVqFBlnOz20Z8Nt9DpzOQrogBbYbWmTOghn8Y+k2mipcb/jYy5+jkVsB0YaBr0XF4h20G6lzIhGx304KayZ0MdtlSLWhqxRIuO2qx3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Kfwl1R6q; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Kfwl1R6q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=+RWmsImL6we1ySRR45zqs1maizjdhSEFotz1FG78trU=; t=1790249548;
	x=1790854348; b=Kfwl1R6q0ArPDmTUrEfd6plC7PqzhmYAebIauN/RqlD3QQa8+Usy3vcptXcyo
	jejqoYKawxfRNZeh7M+REtoFEpker4wprXhkgUyL84OFeqVhm4EjjqwT9qWVUZXY1PX1E2nRsnM/z
	6n6UpQ4FADlIRJlw+QVh7+6F3MCi/Krb00NTnpUZJG9JfjesuWj2tEBdemu8ExHLvRKVCvvdyOIHE
	sQus1Ort5AIplz/xJ3325Fcs+4T82+qH4Pka667hbmZsNfaw8ahLNwxPmsbMD0thsrP+02DsRACDc
	UcZwRUNSlI1NAjChc0qvdniEV45iN2p8HFTrYgPHgvIJdDnlkg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.100)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1x9hgY-00000003FJF-3pAq; Thu, 24 Sep 2026 13:32:18 +0200
Received: from p5dc55206.dip0.t-ipconnect.de ([93.197.82.6] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.100)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1x9hgY-00000002bsY-2sx0; Thu, 24 Sep 2026 13:32:18 +0200
Message-ID: <edc1438f270f4b298c08c34980733475b4b73195.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/2] Make sun3 work again.
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Daniel Palmer <daniel@0x0f.com>, sammy@sammy.net, geert@linux-m68k.org, 
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
Date: Thu, 24 Sep 2026 13:32:17 +0200
In-Reply-To: <20260924111851.3501100-1-daniel@0x0f.com>
References: <20260924111851.3501100-1-daniel@0x0f.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Daniel,

On Thu, 2026-09-24 at 20:18 +0900, Daniel Palmer wrote:
> Short version: Have a QEMU fork that can emulate all of the supported
> m68k machines via the magic of LLM. LLM also fixed the ones that had
> bit rotten. This series makes sun3 work again. Commits are cleaned
> up but I have intentially left most of the comments intact as the LLM
> debugged it not me.

Very cool! Thanks a lot for working on this and resurrecting sun-3!

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
