Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9422556E
	for <linux-m68k@vger.kernel.org>; Sat,  5 Apr 2025 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882470; cv=none; b=Po/4AQXeWpby403hPk+Y1iOQN/X6qn/h35EoDJD13Vzaqp2hs5KGn1WDRQC+D+TOqZ5JiKKZARk22iKA+SYPF7nGcMHwvzoyWi9yUIC/0jAr51oy158E+f9fddo/wdLd61yONBl1a6xrkFXL8eWrKtAoXy0coybjE4i1yy5bm9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882470; c=relaxed/simple;
	bh=JJWd3VrYJg7NadGpLg0hKPXyIGy1o5UPzNpQvd9Y77w=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=jIMnu6BSYthfluUvhdBFPeShvGq+Mn0GW6GV7Z2tjaYsDyMx1VfIiF1O2qRVYUEfkbTqdlDY8zCxlOrvUloI9cbdsrms4KethpzVsC8eaWFO7tohn4lhEBMIeXsQ4dBfldDrCvGe/8+YDfYuo5blOpsoUFODpAd0LYfBGZ/qMBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=bOPNcNYl; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="bOPNcNYl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JpF0JOQebZ89fl9hB5QamUEKlT4Y46lhzIdc6VdPXxc=; t=1743882467; x=1744487267; 
	b=bOPNcNYlNu/emPllupnBTmGvW6odB8005+HZ9LpEDYY0msh0pmtu9ZTv0WzZaVBTAoesxvugnkb
	2oDS5PZ3T199FFZrHKVkFAcGiEc5wAh2Xou5xw/mjYmQ8l1YYf4y/dEYtXUS5WJS2PKmfTXcRwlUn
	JDVjb47mpnCKC6g53RNRytX1pwBFG+4mCkB1uOEUmbpPnGYZ1OW+FQkpQJrNF1QtJ6syv4mxJasKk
	YKQRLGtbEGp9TptKzg+fgiznrkm8LSlqpfeev/+o6bOaWXP+BRPFiQf3zDgtFV7Fs5vmOL6SbjpdV
	dmLYf7de+4QMiU8xfd46WY6mLdtyqa9dKlKA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1u19UX-00000000m9s-0zQE; Sat, 05 Apr 2025 21:47:45 +0200
Received: from dynamic-002-242-014-214.2.242.pool.telefonica.de ([2.242.14.214] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1u19UX-00000000uLS-0B33; Sat, 05 Apr 2025 21:47:45 +0200
Message-ID: <39d9820e9aaf9d94c35234cc011c06f8a263d99e.camel@physik.fu-berlin.de>
Subject: [RFH] Creating an FTBFS package list due to 2-byte alignment
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>
Date: Sat, 05 Apr 2025 21:47:44 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello,

there is a tedious but easy task to be fulfilled for the m68k port
which could be crowdsourced which is collecting all packages that
fail to build from source (FTBFS) due to the 2-byte alignment on
m68k.

This can be done by looking at the following page:

- https://buildd.debian.org/status/architecture.php?a=3Dm68k&suite=3Dsid

Then look at the package list in "Build-Attempted" and click on any
package such as "libtpms" which leads to:

- https://buildd.debian.org/status/package.php?p=3Dlibtpms&suite=3Dsid

Click on the red "Build-Attempted" field for the m68k architecture
row to inspect the build log and find the cause for the build failure.

To find the exact point where the build failed, it's usually wise to
search for the string "error:" (without the quotes) and you get in this
case:

tpm2/BackwardsCompatibilityObject.c:77:1: error: static assertion failed: "=
OLD_TPMT_PUBLIC has wrong size"
   77 | static_assert(sizeof(OLD_TPMT_PUBLIC) =3D=3D 356,
      | ^~~~~~~~~~~~~
tpm2/BackwardsCompatibilityObject.c:160:1: error: static assertion failed: =
"OLD_OBJECT has wrong size"
  160 | static_assert(sizeof(OLD_OBJECT) =3D=3D 1896,
      | ^~~~~~~~~~~~~

The failing static assertion is a clear indicator for an FTBFS due
to the 2-byte alignment on m68k. This is because the smaller alignment
causes the structs in question to be smaller due to the smaller alignment
causing denser packing of the struct.

Thus, libtpms has been identified as a package that FTBFS on m68k due
the 2-byte alignment issue and should be added to the following wiki
page:

- https://wiki.debian.org/M68k/Alignment

See the history of the wiki page for a hint on how to add another package
to the list:

- https://wiki.debian.org/M68k/Alignment?action=3Dinfo

So, in the case of libtpms, add the package after libsdl3 in the list and
use a changelog entry like "Add libtpms to list of affected packages".

Getting the list as complete as possible will be useful to further discuss
the alignment issue on m68k.

PS: On Debian, build logs can also be downloaded with the getbuildlog utili=
ty
    from the devscripts package. See the instructions at the top of every b=
uild
    log shown on buildd.debian.org.

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
