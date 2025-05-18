Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187CA1EB3E
	for <linux-m68k@vger.kernel.org>; Sun, 18 May 2025 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747580830; cv=none; b=tySJX1FEobMtknsgfRRzAgtZTTkucVaFcxQMxsc72Rl4VJ1H7tiMBDBFPCtiCv4xh/ilzWEtrcdzica3/2s5IlHSCL9w27w+NmIvQbNaKa2X2UbTfwSOCpnRDmTh7rgk+u3R+rPB2wDS00uxORhM+y7dg7h9/O372pBMzCHpNrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747580830; c=relaxed/simple;
	bh=TmiWy5FlPOIpKZzEJYmQvYWfB3pnj1myJ+e24YkzlhY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fEJG3jv2F6/2q0J1XYdj1rVoP3tAJDj4wl7IOxt23FoAD8n0UzAgRqzFmYG7cMl+YfW7FBbxOTtVuUI8uw3WxX/VQoTux0dAuOMYYv/K14ctntT6VterN6ooNkDmU8VLRXlm7L5jtlbbdWLDUoPG9v2ZpMAy2ZppAynTKsI8m5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=K2bGzHr6; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="K2bGzHr6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=If03cRDqdqG51iknoqITp/fUeOEZ4uwtQzmGhgzJfGs=; t=1747580827; x=1748185627; 
	b=K2bGzHr6C7MA4F866IqXNHMngJzcebz6PaqNSCGuLj3+pUxYJTK5tTAER7CbbvXBX7qEYncJEBw
	pTMNyFrig+VVMyxxHiRRxKWr9RLSyxWh2iPXrRJUtXXYV5elgwsL6HLzJFtrsOf+Yef9z9x70/PH1
	BxCHOfWrqpUrge3dBpCn2j6ht46l+lGjA9vdHKalL12ncXSUUqjFbeUl9Q5/IcSa2P4VDyWUz2xPR
	YSUvb+CulhpYh1TJAHZtoBqGm17Zu/LpctQue3m5ShID4wDFpGZcfk1voeHpT8qKFbrjhzv6M3yaQ
	3zdqYAoAqKZs2RrDGiljTw/HNMS336EOh8tw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uGfbU-00000000YLT-1JwY; Sun, 18 May 2025 17:07:04 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uGfbU-00000000wvd-0M2c; Sun, 18 May 2025 17:07:04 +0200
Message-ID: <ab38d00426f3a0be1d312d969ebc747a569ebc74.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Antonio Vargas Gonzalez <windenntw@gmail.com>
Cc: James Le Cuirot <chewi@aura-online.co.uk>, libc-help@sourceware.org, 
 debian-68k <debian-68k@lists.debian.org>, linux-m68k
 <linux-m68k@vger.kernel.org>
Date: Sun, 18 May 2025 17:07:03 +0200
In-Reply-To: <CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Sun, 2025-05-18 at 16:39 +0200, Antonio Vargas Gonzalez wrote:
> It correlates with the default in AmigaOS, which was originally
> optimized to fit in 256K of RAM.

AmigaOS doesn't use ELF though, it uses COFF. And Amiga Unix, which uses
ELF, has a default alignment of 4 bytes as specified by the AT&T ABI.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
