Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C5B2676FF
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643080; cv=none; b=N4JpETfPDfHw+jzn7mueSHJvRLN6tQVkiG8orKQSNQjPV0D4MTIhPyOGhTijlzJJGToQ2PTTB/WE5EtWcTb6Mnhkjkj4uEJWP2r+73qtYy88uU364HHhHAQAzwrWUBUxTuW7cSruPCZNUa/e12aXj+Y5MXfTAYRUqH7laXrJVQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643080; c=relaxed/simple;
	bh=S4ZeZH/c01NlN3/wkQT688s2HyaJwQy0ETVlcD4uOCM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BdpDySGjxBp006ZcWvhQSG/27qJsoYXO1wz2lwOeFlO3H+LZyNi4B1CjKq9U9TR05IUDykJ0PC8KJHeCPBYlfD2fYHE5h5SZaWPHS4dKFyiAnFwlKT2UlmMjALFkCLh9vlQ1TyyST/5afURi4f+GtUMEJ1If3YsEc9Dwq5amGVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=cvuCIQnw; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="cvuCIQnw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SVEwF0hYAUk27vbyx2cqQVJIPAkfr0LuL78ryzyNoaE=; t=1747643078; x=1748247878; 
	b=cvuCIQnwzPkFV1N9VPGCtldHT40QRKCxge65gICpbbTUks8Qs7z1mSuKVv25IL4aLFklfe8HFnV
	extt8X9Ds9mONW9I8ZeodrFC+W5zePYBhGnnk25SAJzqfpe8xT8qUWqy0xKyXdiYvffYoAzs+EP0F
	cYiNQPpoJqs3L9JmxfNA35f4KD1TQ3gRD1E5e4RAwPzFf0KyAyV6oFANa47MQYbuY51bg+T26dfWI
	nJERuBRpIncZR0DYSWRSPtFqy/NfMw+c5231tNVRA/hUA0Cf94WzccFtZbw9cPP5eF035kG3GbWll
	J/yEpK3sQGjYT3eZF7rfaRH4d2ek60eNzPgA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uGvnY-000000041ej-1tDy; Mon, 19 May 2025 10:24:36 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uGvnY-00000002yXQ-0t4H; Mon, 19 May 2025 10:24:36 +0200
Message-ID: <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Florian Weimer <fweimer@redhat.com>
Cc: James Le Cuirot <chewi@aura-online.co.uk>, debian-68k
	 <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>, 
 Libc-help <libc-help@sourceware.org>
Date: Mon, 19 May 2025 10:24:35 +0200
In-Reply-To: <8734d1kofn.fsf@oldenburg.str.redhat.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
		<08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <8734d1kofn.fsf@oldenburg.str.redhat.com>
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

On Mon, 2025-05-19 at 10:14 +0200, Florian Weimer wrote:
> * John Paul Adrian Glaubitz via Libc-help:
>=20
> > I was just looking at the necessary changes to switch m68k to 32-bit al=
ignment
> > and I'm not sure we need to do anything about glibc. I am documenting m=
y current
> > findings here [1].
>=20
> > > [1] https://wiki.debian.org/M68k/Alignment
>=20
> Why doesn't this change need a new target triple?  This change alters
> struct layout (it introduces new padding in some cases), so it's quite
> incompatible with what we have today.

My argument is that Linux/m68k is a pure hobbyist project and anyone involv=
ed
can deal with the changes coming from the alignment change.

Introducing a new triplet would mean having to accommodate for that in othe=
r
projects which only know "m68k-(unknown-)linux-gnu.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
