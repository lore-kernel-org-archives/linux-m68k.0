Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C6202C29;
	Sun,  6 Sep 2026 06:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788677053; cv=none; b=rF0NbXgBWwg98ShahAhXUtYb6amBucrF7Xvz5NCGMEqgKAavvZhIkFcdKPI1+Cg97jFXgh8sbALk+xh1LNC7YHyGfVsboNF4Fl1UJLOHJQMN6OMnsaL7vLmwrXebNkaFUwCMP+zC4MOJyS25uS33cILju7xJFR6fQNU/9EmJ9gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788677053; c=relaxed/simple;
	bh=PPpde2R4rB8ZoAWExc+0poZci224vLF85ghTounXyWM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pS0H2q6NzsPckDx6EuE1fjc7yJca60s8/DloWoyhkZu3Go5v4nCOPKKerQFCPkmvJJsNtiCNBWxr2KfKIMH2lrThopyknCODVdn9EBemwwd7vgKi+gqZDubd4y4bvf8Pm3OOIvxBqeNAoDNX2Z0cLrkYrtQckFwB5KRwnGjZDfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=lEN/2nc4; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="lEN/2nc4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=uLp+pYZScfccrGeWgbNC7x8og+ftP2mZUPb6nwJ7rAw=; t=1788677049;
	x=1789281849; b=lEN/2nc40vgzQAc1QVJ7OHpuJKoTZzZQ4KUBEFSE+xiIdS4RfesHuGheftyQa
	++D5yc5o5HIPtSCEwDmjmPdmjefqxinpXHsafD8S+Cd6nwvmXxQp0jhBj9Ieo3/qHumB2pBMs/Xsa
	2kBpSnk6XKh7HAc5Q2iLtQuhhNJBLw+UxTMvg43hm1cnBhnuujI/r62rDRGvlCa3BvkhP8/IgvBA3
	AIzAygpO3c+utm/+0CP76PqBL4N9whar+IVDT0Em46mNtDKIaqFK3pFMJCSiTqBDlDoxPHbQ/9BBr
	ih0qrggWP7k54U78eDLFFWU5flKPUFbO0Vsybo9g7oY0aeY2PQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1x36bg-0000000106L-2U4P; Sun, 06 Sep 2026 08:44:00 +0200
Received: from dynamic-078-054-244-244.78.54.pool.telefonica.de ([78.54.244.244] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1x36bg-00000003dnG-1aDR; Sun, 06 Sep 2026 08:44:00 +0200
Message-ID: <e038c283a0ee7a3932f3e3bfaed188280ff7188f.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] m68k: coldfire: fix typo "reseting" in comment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Josh Juran <jjuran@gmail.com>, Hemanth Selam <hemanth.selam@gmail.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
	 <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Date: Sun, 06 Sep 2026 08:43:59 +0200
In-Reply-To: <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com>
References: <20260904112336.38497-1-hemanth.selam@gmail.com>
	 <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com>
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

On Sun, 2026-09-06 at 02:40 -0400, Josh Juran wrote:
> On Sep 4, 2026, at 7:23 AM, Hemanth Selam <hemanth.selam@gmail.com> wrote=
:
>=20
> > Correct "reseting" to "resetting", reported by scripts/checkpatch.pl us=
ing
> > the misspelling list in scripts/spelling.txt.  Only touches comments, n=
o
> > code changes.
> >=20
> > Assisted-by: Cursor:claude-opus-5
> > Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> >=20
> > - *	There are 2 common methods amongst the ColdFure parts for reseting
> > + *	There are 2 common methods amongst the ColdFure parts for resetting
>=20
> Is there a reason to leave =E2=80=9CColdFure=E2=80=9D as is?

The AI assistant probably never heard about ColdFire, so it assumed the spe=
lling
is correct ;-).

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
