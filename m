Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6F01BF33F
	for <linux-m68k@vger.kernel.org>; Mon, 26 May 2025 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748283795; cv=none; b=MOeYJIsTBiq7jTkNPEq1quo49AnzM2XlKZkqTEC47C5403ioXTX7dJfBXpJ6uWwt10sdQWB1BREStGCzm9ro+5l+/z5NEf1Vt1It45V9QKUcN6LuWrqlHoCAmy9ihfT6Do17OJU6rN4WrpLjBVEYsS13P/N1BzDua/R5qMUnfr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748283795; c=relaxed/simple;
	bh=n69ZBO/IIEni7Mp2Sc2LQ2fa2jFDdfGFot2QzVLCrHc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GlPx/f6moiDjdpArSog90mI8k2VzcB1bT39VQy540nXyWL8uvISHaKNpUycWax94ygIjHlrh3tsdCONXWuAChOMBhJDlobcAAVe1wXq/uik/xzN1PWcF3Blq1IcLLodphe0XjwvXBpKcmUdj/NOWsMWmNORn6unJtDN3A6K9ms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=HyTszc1l; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="HyTszc1l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5nRda+SP0hiVUf0+07lmhBuhJWkp2hcZvzOikdr6V9o=; t=1748283792; x=1748888592; 
	b=HyTszc1l0COEL2d3jO5bZM0nzdS5Sq1pXrsv+87DTidzDKrAlogfL4dAboOn0lag+7xY8tvHAYK
	x++Qksc/ssz4UZcI5UYRkb4/lugXrtj/dxgcKInBcKQnN1+H1ILVSogng5ZKV8bVwtPmQWVM7xHHA
	sAPpFmo4CVBGvxvcW8xL7dZY1RDxl5GguwSIWam76gFfYjA7KEqDMNmuVqfN+/voeuzQ0dQf+R8Is
	+sb9sL08QfpQUay/+qevDyHWRgrRLs9cFeUwWAP153fO+GEOHPn69ybxy70wrF7skVjHlGQ/0fjv9
	dPgga+k5LMd1eBWG8tqdHyWCePkB7EFe+MAQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uJcTd-000000033ms-1Scz; Mon, 26 May 2025 20:23:09 +0200
Received: from dynamic-078-054-122-178.78.54.pool.telefonica.de ([78.54.122.178] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uJcTd-00000002rJg-0Ana; Mon, 26 May 2025 20:23:09 +0200
Message-ID: <e22c54a868bb70825aa3f91084742fded97470d6.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: noloader@gmail.com
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 26 May 2025 20:23:07 +0200
In-Reply-To: <CAH8yC8=bbDMNFLj=eQzW+ZHvJpH0ZdVQthfscTo1fe0w=wnU_g@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <CAH8yC8=bbDMNFLj=eQzW+ZHvJpH0ZdVQthfscTo1fe0w=wnU_g@mail.gmail.com>
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

Hi Jeff,

On Mon, 2025-05-26 at 14:16 -0400, Jeffrey Walton wrote:
> I don't know about the 64 byte alignment on NetBSD. Maybe it was
> copied/pasted/modified from amd64? amd64 has a BIGGEST_ALIGNMENT of 64
> due to AVX512. Prior to that, I believe amd64 had a BIGGEST_ALIGNMENT
> of 32 due to AVX. (These were due to the aligned loads, like
> _mm256_load_epi32 (32-byte requirement) or _mm512_load_epi32 (64-byte
> requirement)).
>=20
> For PowerPC with Altivec, I believe BIGGEST_ALIGNMENT should be 16.
>=20
> I don't know if __ALTIVEC__ plays a part in BIGGEST_ALIGNMENT. That
> is, should BIGGEST_ALIGNMENT be 4 (for int) or 8 (for doubles) unless
> __ALTIVEC__ is defined; and if __ALTIVEC__ is defined, then
> BIGGEST_ALIGNMENT should be 16.

The alignment is specified in bits here, not bytes. Hence a BIGGEST_ALIGNME=
NT
of 64 means 8 bytes, not 64 bytes.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
