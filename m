Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9960D370ADC
	for <linux-m68k@vger.kernel.org>; Sun,  7 Jun 2026 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780823299; cv=none; b=Mts4zPXNc/XfLLwEXlLQ2mlDTSzj4RscaUj5vQocKk0XxCqz3tZ50/I+JJo/EnnwwrED53OXDOIxna310OVfMfWonW8Qe9xJQ4hQERoQAVg0F8CCJfmsDGvabNHI7YPmdkgwXviUpEI+j6jH5tf/t3Q4cd/Qn5fe+cLbXT+NDHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780823299; c=relaxed/simple;
	bh=JR5lL+lAqec4ZHKAMW5N5dqzGyNabZE182vkGiAllbs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N4ttpDH3Bsof5cacC0qIraSTePbmdSfm2+dz4qxZam8n/naOJ/SbAqq2iycxnImXj8x9S+6EVNOH737/tXEHNB4rjJ2i6qgsf4fkE0VuOPRnKuolHYguKaBAhFzEuFznXiUXzo4ylaq7KEuC6BqOuNWZa6bYtFGPpRh8How26us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=DlJLJGn9; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="DlJLJGn9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=iAi3brcyWT3+PnCFVV0/aNjF6JYcqC0tLwVJ+pRcWoM=; t=1780823295;
	x=1781428095; b=DlJLJGn9rt5C3vtgCd/vuQndmYKq0dox18Y5DPfJm8jSYLa+bcvFuF3qeZm9R
	LqtqMvjsPgXEl84+zvEvAJ2fPZV+yYuy7Q+ijR8GzVbASK3+vKUrKIB0H+5KyjqUKMaX5HT//qYuy
	CiUJhoTGFMTjYItdaN0C42MYVrYS8LhyeJltavgt7lvHTHn8QYJv0fGaNVcwKsackCpHCbFd861NL
	JzltvP3Gyv7hcUzCTzBtnXQ2fvruVVOebHNo7JD5NxP/mYbDfGIa+RdcMJkw41/c5l19A9coFfvlB
	eHkNUuLZ7ODrhiVQdnscqn0mFxs9Xf9fFmawuNKi8+6YYVYDBA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wW9RG-00000000qA2-3OGl; Sun, 07 Jun 2026 11:05:02 +0200
Received: from pd9f74f36.dip0.t-ipconnect.de ([217.247.79.54] helo=[192.168.178.52])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wW9RG-00000000xPy-2VZa; Sun, 07 Jun 2026 11:05:02 +0200
Message-ID: <49e6f18c2eed28743afb4d22717a93af8fb9089d.camel@physik.fu-berlin.de>
Subject: Re: First successful cargo build - Re: Summary on what's blocking
 full Rust support on m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>, port-m68k <port-m68k@netbsd.org>
Date: Sun, 07 Jun 2026 11:05:01 +0200
In-Reply-To: <e6e99dd2a47881aaf34ea8d1dbc5ea8d6080c1c1.camel@physik.fu-berlin.de>
References: 
	<29d725b5647c176b8cef0d3442d1b3440e6a1a9a.camel@physik.fu-berlin.de>
		 <6efb67b12fd971c6d38a692d7b391ce4a75b0f4a.camel@physik.fu-berlin.de>
	 <e6e99dd2a47881aaf34ea8d1dbc5ea8d6080c1c1.camel@physik.fu-berlin.de>
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

Hi,

On Wed, 2026-05-20 at 10:36 +0200, John Paul Adrian Glaubitz wrote:
> I was eventually able to build cargo for m68k-unknown-linux-gnu:
>=20
> (unstable-amd64-sbuild)glaubitz@esk:~/rust/build$ file ./x86_64-unknown-l=
inux-gnu/stage2-tools/m68k-unknown-linux-gnu/release/cargo
> ./x86_64-unknown-linux-gnu/stage2-tools/m68k-unknown-linux-gnu/release/ca=
rgo: ELF 32-bit MSB pie executable, Motorola m68k, 68020, version 1 (SYSV),=
 dynamically linked, interpreter /lib/ld.so.1,
> BuildID[sha1]=3D7e5bf08930f87b9eaee173cf163b067f620cb841, for GNU/Linux 3=
.2.0, not stripped
> (unstable-amd64-sbuild)glaubitz@esk:~/rust/build$
>=20
> The binary runs on m68k but there is no output, unfortunately. Needs more=
 debugging.

Some more progress. I managed to cross-compile "Hello World" in Rust for m6=
8k and it
actually runs. The issues which prevented this are two bugs in the LLVM bac=
kend, one
is already known upstream [1]. I will file a bug report for the second one.

(unstable-amd64-sbuild)glaubitz@esk:~/rust$ uname -a
Linux esk 6.18.12+deb14-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.18.12-1 (2026=
-02-17) x86_64 GNU/Linux
(unstable-amd64-sbuild)glaubitz@esk:~/rust$ cat ~/main.rs
fn main() {
    println!("Hello, m68k Linux world!");
}
(unstable-amd64-sbuild)glaubitz@esk:~/rust$ ./build/x86_64-unknown-linux-gn=
u/stage2/bin/rustc --target m68k-unknown-linux-gnu -C linker=3Dm68k-linux-g=
nu-gcc ~/main.rs -o ~/hello_world
(unstable-amd64-sbuild)glaubitz@esk:~/rust$ file ~/hello_world=20
/home/glaubitz/hello_world: ELF 32-bit MSB pie executable, Motorola m68k, 6=
8020, version 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, Build=
ID[sha1]=3D819625f88d263c358cbf7ff37d660bc453eca931,
for GNU/Linux 3.2.0, not stripped
(unstable-amd64-sbuild)glaubitz@esk:~/rust$ md5sum ~/hello_world=20
c12f86b37b301331e14499b573e45955  /home/glaubitz/hello_world
(unstable-amd64-sbuild)glaubitz@esk:~/rust$

glaubitz@mitchy:~$ uname -a
Linux mitchy 6.15.0-rc2-virt #1 Thu May  1 10:27:28 UTC 2025 m68k GNU/Linux
glaubitz@mitchy:~$ file ./hello_world=20
./hello_world: ELF 32-bit MSB pie executable, Motorola m68k, 68020, version=
 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, BuildID[sha1]=3D81=
9625f88d263c358cbf7ff37d660bc453eca931, for
GNU/Linux 3.2.0, not stripped
glaubitz@mitchy:~$ md5sum ./hello_world=20
c12f86b37b301331e14499b573e45955  ./hello_world
glaubitz@mitchy:~$ ./hello_world=20
Hello, m68k Linux world!
glaubitz@mitchy:~$

Adrian

> [1] https://github.com/llvm/llvm-project/issues/152816

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
