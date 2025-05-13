Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F721CA84
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 May 2025 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747124686; cv=none; b=LtSHfCdfhBYFVwPHQwJs/FcT1rbISjgoLF+ezOH9sHZvAtg7KlVa9pA+/AmZgwBOAXp+KVlbq+1Kw2Pxw5meVuJ/Mffg+1VAL37AbqdBoNazbPNVH9jgd2QMoxZbTKraeRkn6I10c3qCSYdF2ZKE8Afp9o3XxoE/xwUY3MDnn6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747124686; c=relaxed/simple;
	bh=YHA/wvWEDB8CgIoUnHtp7szR/abPgZrTVkvyNlmczCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHcTZt1b+Jua2j5IB7dVBt0aK4q1RLEMPz5NcGPXwYouz+9h/1KD2ay7/TY8tgjl6TKNHqIFsTLF+JuOiJBpyc5gFVtc6L5e8ZQfXItLpi+r/hW2t7WbJv7dvFtyr3U3pLWjsO19UHuQOengSCIAcQNljl4oSHM+rmveRx6zn7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOsLeKXo; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOsLeKXo"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA3395C66A2;
	Tue, 13 May 2025 08:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC30C4CEE4;
	Tue, 13 May 2025 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747124682;
	bh=YHA/wvWEDB8CgIoUnHtp7szR/abPgZrTVkvyNlmczCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOsLeKXoaJjDR7Uej2TlJeM6ZmoE7XJ1eY2NW6EWvVbEdYKdNoHifU2oYl1NCpNcj
	 05cGqKrPBX7tyjVBdRbn+SzIcuKHPlRsbgqJK46eiiMZYYcMLDd0yoBzk0zcctZoT5
	 88rkSUu8KWAF+m3PM71lYiXI9gs2yzOsFIA4FLyZ0jTr5Y8FLRYvi4dISD8QFo1ATr
	 S8P/VCDjGSYzbJcqt8ZzQMjAuYW7D/ZCcdarVIO5Bue5AhTUxLrTClQ71Dn2txfTwz
	 OstRPVaqa7P4ms/78eMW1q+EnE6838KH/802tcNklQ2fgt7QYGzRyfY/YjRkQZm0NM
	 uPsFhWO1hBI/A==
Date: Tue, 13 May 2025 10:24:27 +0200
From: Christian Brauner <brauner@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr
 syscalls
Message-ID: <20250513-wunden-tierzucht-0cd8fb32bb0e@brauner>
References: <20250512-xattrat-syscall-v5-0-a88b20e37aae@kernel.org>
 <vxjuophuvmvqloczajfyjd5jvvcbvcty2fpvfmcaz5xuh5vyqv@fxiymeww26mf>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <vxjuophuvmvqloczajfyjd5jvvcbvcty2fpvfmcaz5xuh5vyqv@fxiymeww26mf>

> Ignore please, somehow b4 crashed with timeout on gmail

Ok, no worries. I wondered why I didn't get all messages of that series.
