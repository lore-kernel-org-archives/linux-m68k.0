Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7774187569
	for <linux-m68k@lists.linux-m68k.org>; Sat,  1 Jun 2024 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717253283; cv=none; b=kNQWTONKuidXnIfi4+Qx7q6qBFphtsX3lRuoWSCNYctNqDgLfx57V8JD2n7O1b6aoiaAQWoFEyQzIBgs9TFkTtt1TZJ+I4qLQ4uI3O4lrXfZuP9bqosKbRIRyCb3vK1ibs2dZ/nKoeuEHXD7g5ClNa6NboGcq8DHwsnBI0SROgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717253283; c=relaxed/simple;
	bh=rjZIHLk+x8DggtfJEWXJ3YxaAZS2pDs76To+ZYzg7bE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+KE5bFZCiCQcGldJqp08QNPV7YtmNk5m0Lt9JXGl8Vr4tFSNWINfMAIa0PfbU4zcXHoRS2RjbaF9ZZIuwWIi75kAgMmy9N/VLVNlUScYizofh31D8ApacImgb1siOVbd+ksjbnNvfgpn7H9VDTmHND1H8IEOvA9w8VHgkGVqBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=SapPJQf4; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="SapPJQf4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H/Qkb84NNIu06A3PSg8cUZMgUFaFuDIUY4clT7Isdrk=; t=1717253278; x=1717858078; 
	b=SapPJQf4FvwOnOBtuwE+nvBmEhTKKQTP+pWfwpUKJQH4KqsLun/wtFc1D7CC3Ph7+wKtb0YZjpv
	YA7V5YLGxipk0QGmdLkNewhBIgseP7D196FKCcXH0YE1DK9NKI0A71IOIaX6adM9iBGSzKT8AL6/B
	IbAnkV8dLKeGh2R7JfzEKgrexYV1bybAEXlWvWc88pmmYqpWzg799ZyY03H+6DbS7p2afCYUex3Jt
	tgIab21SeV/0Qrx0SVThOzA2pVkdyYxMWj0rLaPCytBZOfT3qUrqY3vFF5tE7F/geummeodKs85Df
	ZRo8I+6uQih/1KBVFvfBlLUJ3MfoPeV8veUQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.97)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sDQ1O-00000003ge6-0lMg; Sat, 01 Jun 2024 16:47:50 +0200
Received: from p57bd9a40.dip0.t-ipconnect.de ([87.189.154.64] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.97)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sDQ1N-00000001C7Z-47nG; Sat, 01 Jun 2024 16:47:50 +0200
Message-ID: <8aeb22e0e0e1db22fb4f0d5a56875bffcb3753ef.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3] m68k: amiga: config: upon boot, turn off all
 incoming interrupts from the Warp1260
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Paolo Pisati <p.pisati@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
Date: Sat, 01 Jun 2024 16:47:49 +0200
In-Reply-To: <20240601143216.144220-1-p.pisati@gmail.com>
References: <20240601143216.144220-1-p.pisati@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Paolo,

On Sat, 2024-06-01 at 16:32 +0200, Paolo Pisati wrote:
> Amiga 1200 boot crashes in local_irq_enable() (or auto_irq_enable()) with=
 an
> interrupt storm (the Warp1260 board interrupts appear to still be active =
at boot
> time): CS-Lab told me where to find the interrupt register (and its layou=
t) so
> here's patch that turns off all incoming interrupts during
> config.c::amiga_parse_bootinfo().

It's not really necessary for a patch to include its history of creation in
the long description. Rather, the long description should just explain in
detail what the patch does and why it's necessary.

Thus:

> On an Amiga 1200 with equipped Warp1260 accelerator, an interrupt storm c=
oming
> from the accelerator board causes the machine to crash in local_irq_enabl=
e() or
> auto_irq_enable(). Disabling interrupts for the Warp1260 in amiga_parse_b=
ootinfo()
> fixes the problem.

I would also rephrase the subject as follows to avoid the comma:

	Turn off all incoming interrupts from the Warp1260 during boot

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
