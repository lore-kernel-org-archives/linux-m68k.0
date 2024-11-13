Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538FF38DE9
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731507273; cv=none; b=tURK3NgbBLDbSgJRfH+rDpojKxQCN3pdVHTHf45aCid4QEhz6YRnSfms8FmNcltzQXjtQY4w5GTpD2lrIKPQWHcYzv+xz7ZYcZ3jMuiP+UFZymfFU4WhHt4XhKG6CKcLy3YQ5ejhg0Lm/nry8xusEWUDjdpayJf1ZF/BqJCY790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731507273; c=relaxed/simple;
	bh=NA0vc9IKBOW44juPpGtZW5qtGKO421oPW0rg3ZekUI8=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=K9nXbTtcu/N1vEPUgzgrTqPN9fR41a7a71fzcrNw3Ogoc62e+hxnvL/tJUusEaBL0kn1KK0YeDSimzDZTbc4wOq+N45gM2Vf9Z7xXi9LCq7USUx7Z6pWUFfy/tYnoLFnoAeTuD78dm/XcNxG+VDSeQ+zCqWVFnYS2PjLtYL2aqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=VMhnu+8n; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="VMhnu+8n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x4yZYBguwQx5u5dVotlevswanWfGKL0DB6xAIYjLWLc=; t=1731507270; x=1732112070; 
	b=VMhnu+8nL8OB5+IcFxGj4rb7/oVwt2Pl3K53Zz5oplaE+D4CTPjUtFwiJwCCWSSrplez2G2y8XU
	31szgk1pTqQ7uaC2dPh9mxLUZdXBuI2+QmhYVDH+Q1878rewO1amVz1LlTOtg5vwO1bUtiBAl1VCW
	/Bl4YV9ZVMaswTRFzGegScJLKnsX949/a1qoeWd5noqhD/edxOfb9vSCLRtdWxF2ZqG4Ek1ucy6Nv
	OoKuzEzi3dm29YhrIqD+MOFguPxLrN2QdYctryow/+joY12rnK9StyNGCR3gY0kJZaXLyklH+a3Tk
	7vdOO6kQXNR8jDFQkmpyWCFXRx/JS8k6Knvw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBE8a-00000004ACV-1nDU; Wed, 13 Nov 2024 15:14:28 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBE8a-00000000Rt9-0rgb; Wed, 13 Nov 2024 15:14:28 +0100
Message-ID: <ce3b2551ca4eaec7e732c08037aba1dd073694ca.camel@physik.fu-berlin.de>
Subject: Python 3.13 segfaulting on m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>
Date: Wed, 13 Nov 2024 15:14:27 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello,

does anyone have a solution on how to fix Python 3.13 with 2-byte alignment=
?

./_bootstrap_python ../Programs/_freeze_module.py abc ../Lib/abc.py Python/=
frozen_modules/abc.h
./_bootstrap_python ../Programs/_freeze_module.py codecs ../Lib/codecs.py P=
ython/frozen_modules/codecs.h
./_bootstrap_python ../Programs/_freeze_module.py io ../Lib/io.py Python/fr=
ozen_modules/io.h
./_bootstrap_python ../Programs/_freeze_module.py _collections_abc ../Lib/_=
collections_abc.py Python/frozen_modules/_collections_abc.h
./_bootstrap_python ../Programs/_freeze_module.py _sitebuiltins ../Lib/_sit=
ebuiltins.py Python/frozen_modules/_sitebuiltins.h
./_bootstrap_python ../Programs/_freeze_module.py genericpath ../Lib/generi=
cpath.py Python/frozen_modules/genericpath.h
./_bootstrap_python ../Programs/_freeze_module.py ntpath ../Lib/ntpath.py P=
ython/frozen_modules/ntpath.h
./_bootstrap_python ../Programs/_freeze_module.py posixpath ../Lib/posixpat=
h.py Python/frozen_modules/posixpath.h
./_bootstrap_python ../Programs/_freeze_module.py os ../Lib/os.py Python/fr=
ozen_modules/os.h
./_bootstrap_python ../Programs/_freeze_module.py site ../Lib/site.py Pytho=
n/frozen_modules/site.h
./_bootstrap_python ../Programs/_freeze_module.py stat ../Lib/stat.py Pytho=
n/frozen_modules/stat.h
./_bootstrap_python ../Programs/_freeze_module.py importlib.util ../Lib/imp=
ortlib/util.py Python/frozen_modules/importlib.util.h
./_bootstrap_python ../Programs/_freeze_module.py importlib.machinery ../Li=
b/importlib/machinery.py Python/frozen_modules/importlib.machinery.h
./_bootstrap_python ../Programs/_freeze_module.py runpy ../Lib/runpy.py Pyt=
hon/frozen_modules/runpy.h
./_bootstrap_python ../Programs/_freeze_module.py __hello__ ../Lib/__hello_=
_.py Python/frozen_modules/__hello__.h
./_bootstrap_python ../Programs/_freeze_module.py __phello__ ../Lib/__phell=
o__/__init__.py Python/frozen_modules/__phello__.h
./_bootstrap_python ../Programs/_freeze_module.py __phello__.ham ../Lib/__p=
hello__/ham/__init__.py Python/frozen_modules/__phello__.ham.h
./_bootstrap_python ../Programs/_freeze_module.py __phello__.ham.eggs ../Li=
b/__phello__/ham/eggs.py Python/frozen_modules/__phello__.ham.eggs.h
./_bootstrap_python ../Programs/_freeze_module.py __phello__.spam ../Lib/__=
phello__/spam.py Python/frozen_modules/__phello__.spam.h
./_bootstrap_python ../Programs/_freeze_module.py frozen_only ../Tools/free=
ze/flag.py Python/frozen_modules/frozen_only.h
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault
Segmentation fault

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
