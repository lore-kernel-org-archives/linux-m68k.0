Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A04201004
	for <linux-m68k@vger.kernel.org>; Mon, 26 May 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271950; cv=none; b=JchRYJix3iEueNEW5CUCQZLA9zkyGJMM6sxtQkcu76mhcs8C3k98JF8SneSIz72BKQ8Nuoh6WSsQKoWcX8LHGCNEiOp/lSQDyyZxm7ecqfY7RCTvniMc2D1IWXSqsF7KrsM6DQZu9ZwJox/NF1UlWF8kzEBFrBL2TUlaQ8smHgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271950; c=relaxed/simple;
	bh=SgKMALHkJyZFK82wXmKO681g+91A4tKbQ6jkOin05co=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=TReLOoKgHva+M6wKP77tU0BHNcvK/yeo7cxZW2Sk9XWDTLpYvlRr3xl+JSuY3Sqa0foYB6Ze7rSyF7VzRIghjBcqiU86n9jShHpTn19ii1Z9QaXCVvh43vK0vdU+94JhTcUXKCmla28JAS66Px65V/ggVWLHTv6IVRDXsSeWc8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=aI3b+/SM; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="aI3b+/SM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=adsNFySRxxvmYtSEG94pSAAxwYLsB0qhFjwhVzAQ+7c=; t=1748271947; x=1748876747; 
	b=aI3b+/SM6oFp7mk2iJ0PmCsjyz77NGyQUyBl0+flUONOTRFRvSmwehmXc2IjATC+MAupoS5bQZw
	lLKINE5h2YQpwrUhK/zCq4XJ995pqt1ynj5T1VDcjZjpfmv+8f1kaCU4yo9BI5VizvSaqnmNywdWp
	QOH8HJOMOUMiLIbp1cznf7DYtLJdRuW9dhbA3+gQZZG3O61EjVAyXuzGtQuS9v81F6lYExC8GFKFR
	LcS0EMj+2D6MuHIpvhrEClP9pr8wOa8HVA8aw6k8KjJ9RSGPD0oDdmQJRbMCE8+YMexdVy9Ul8itQ
	jcdWUqaekzC5+SJk8tvHgwh0uaHqi9ohvBtw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uJZOU-00000001NzP-3aRJ; Mon, 26 May 2025 17:05:38 +0200
Received: from dynamic-078-054-122-178.78.54.pool.telefonica.de ([78.54.122.178] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uJZOU-00000002IDc-2ke7; Mon, 26 May 2025 17:05:38 +0200
Message-ID: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
Subject: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: port-m68k <port-m68k@netbsd.org>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>
Date: Mon, 26 May 2025 17:05:37 +0200
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

Hi,

I'm currently testing enabling 4 bytes alignment and first started looking =
into
what NetBSD does (gcc/config/m68k/linux.h in the GCC source). Surprisingly,=
 this
is set to 64 and not 32 bits for the largest possible alignment.

The explanation is as follows:

/* No data type wants to be aligned rounder than this.                     =
                                                                           =
                    =20
   For m68k/SVR4, some types (doubles for example) are aligned on 8 byte   =
                                                                           =
                    =20
   boundaries */

#undef BIGGEST_ALIGNMENT
#define BIGGEST_ALIGNMENT 64

BIGGEST_ALIGNMENT is what's being toggled with the -malign-int option
in gcc/config/m68k/m68k.h:

/* No data type wants to be aligned rounder than this.                     =
                                                                           =
                    =20
   Most published ABIs say that ints should be aligned on 16-bit           =
                                                                           =
                    =20
   boundaries, but CPUs with 32-bit busses get better performance          =
                                                                           =
                    =20
   aligned on 32-bit boundaries.  */
#define BIGGEST_ALIGNMENT (TARGET_ALIGN_INT ? 32 : 16)

In order to test GCC on Linux/m68k with 32-bit alignment, I just copied
the definitions from netbsd-elf.h into linux.h above which eventually
failed with:

free(): invalid pointer
during GIMPLE pass: slp
../../../../../src/libstdc++-v3/src/c++17/floating_from_chars.cc: In functi=
on 'std::from_chars_result std::from_chars(const char*, const char*, double=
&, chars_format)':
../../../../../src/libstdc++-v3/src/c++17/floating_from_chars.cc:1243:1: in=
ternal compiler error: Aborted

Now I'm wondering whether why some types on NetBSD such as double have 8 by=
tes
alignment on a 32-bit system. Does anyone know the reasoning for that?

And does libstdc++ have an additional codepath on NetBSD to deal with the
largest possible alignment to be 8 bytes so that the error above does not
occur?

Or could it just be a result of the ABI mismatch because glibc needs to be
patched as well?

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
