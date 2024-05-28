Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3005770EB
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 May 2024 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716882431; cv=none; b=SDz/BBdqNejQyqw/rYhivaVl0BQ4eFK5Bxt0hCxLypss7WiarZjIrDaFgqAaTYWlJ9chMT2LknveXilktW1jWawGrkXKLdx/ebv657017NC+A8JYHMuMOS/EyFFVoEJ8yey1CfQEzRNs6gvyrlFL9jI24B6VGenZMnX0SVelxHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716882431; c=relaxed/simple;
	bh=vJod6bLAwnrvkxNN+7ZhGsi/xe+GgDUDWGehZaHu8/I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dt3WNBlHu9xD2d5JPzwM9PQGogoC2uc6TIX4J2ns0TXJADmTgZyk2lxcFMzCpZ9Atwdx86L5YF2/OdpxEcTSGf+dE3veZ9dbjiDd35Woh4daSkOXKvSD1MP4WrAeY9/5q8hZc3SE8be+l12DCeN0PySUAkQkeM//8l0XS1vkCe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=CnQFEE7c; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="CnQFEE7c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nRabygLD8XV6632cICda8q3b2Xo04/oIRbkQtRbOzJI=; t=1716882428; x=1717487228; 
	b=CnQFEE7cKhpcmQ21bFiVE487yJYcFlcY1KSojw4kWVh5HvD0um8g7C7L4ZtUkA8PAcO++Uv9HN6
	cObAZkn/uov2T83gvFM+ihTqKuf4im4OxlCUs589ld8JfCQlreTC+nVsGwkoGmkCma1FkEQCtxz5h
	l4hy3OQmJQlie87HHgr7fJXddseHnI0n7uxm3OTC5kOOX8CWK8NX5HBHWBae/wwxtWAfX+sR81CfU
	J9phqFGGwUrXY56qmsfs+Sz1gUsQI368oolWGjXF2SagAwce+GrgioGbkIWsRbCOZvirwTEBwSdkn
	J4CSPd9FU2Rc55SXzJ3IB+1tOJOFzwi5OwIw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.97)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sBrY1-00000000cCO-2CSE; Tue, 28 May 2024 09:47:05 +0200
Received: from p57bd9a40.dip0.t-ipconnect.de ([87.189.154.64] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.97)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sBrY1-00000003mi3-1JuZ; Tue, 28 May 2024 09:47:05 +0200
Message-ID: <e736c8a8fb9cf601f949197b228bdc472a09d212.camel@physik.fu-berlin.de>
Subject: Re: Kernel Image Format Issue - Coldfire mcf54418 CPU Failing to
 Boot
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Greg Ungerer
	 <gerg@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Date: Tue, 28 May 2024 09:47:04 +0200
In-Reply-To: <fa1cb665-965d-4215-bb28-82b629156d83@yoseli.org>
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
	 <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
	 <45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
	 <d94c6e57-58d4-4299-a23e-013a3cb13997@linux-m68k.org>
	 <f316b64e-c696-478d-8383-5d18c96e6c11@yoseli.org>
	 <106876d4-a93f-433f-848d-da85ab84bd14@linux-m68k.org>
	 <6376845d-e741-4117-bfd3-81860ba08399@yoseli.org>
	 <9cd36f99-f4d3-44bb-ab22-e1e497906048@linux-m68k.org>
	 <6120cdb4-4666-418f-8d2d-5b0e72662e3e@yoseli.org>
	 <fa1cb665-965d-4215-bb28-82b629156d83@yoseli.org>
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

Hi Jean-Michel,

On Tue, 2024-05-28 at 08:32 +0200, Jean-Michel Hautbois wrote:
> For the record, I found the issue, which is already corrected latest=20
> kernel by [1].

That's great. Since I have a similar problem with my SH7785LCR which hangs
when u-boot tries to start the kernel, maybe we can debug the issue in a si=
milar
way?

If I understand this correctly, you hacked in serial output at a very early
bootstage so you could see what was going on?

> When I get into my kernel after u-boot jsr, the SP is [2].
> I don't have any initrd, and it is deactivated in my defconfig now, but=
=20
> we still try to access the address, which is 0x00000000 !
>=20
> I think this patch should probably be reported to the stable kernels too =
?

Such patches are normally backported to stable patches automatically.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
