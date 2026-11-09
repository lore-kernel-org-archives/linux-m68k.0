Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223658;
	b=NA5/jVB9UnUid7OSSGgueL+MK659hajF+8u1mG8dt4Dte/qVgHoLkP5I0HO2//Pc0Lnx
	 ntluDmOyFJbri5qlTBJdExzJ9xXdJkflZB6bCg8+Lgjr6kS8SkAD8Q3Qok0cXRbMQuVCI
	 w10XzQ84HE9TdEnX2lo5S5GEddIuoBoS3MbIpBC+U9zCYuoKiyn+AssRlWsFXt1NneTAl
	 CrsNhy15gJ1J/QpnP/wrpcNsqMg6Hm8lRZUOttuJ7PPyJT2YQ2AeypyBzVwvxME/hW7pq
	 gYm42PInTd4e3q3VZL0GV4O+Iwgv5N2rem4zyLIObpZFbBe0yLnSehzR41igQ3qmwtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223658;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GTe3rVqqBFubJwfvXPNDDRZX+sidHXepwnZzWomDy5A=;
	b=jPQmqbi4rE8y7bqg8AtCwdVvVYWLrEFEA9qCtVs2vHQQbspQ6sFLRndRrK+rj89Z6jlh
	 Dfg1zQkzHwrrhqzEDIjGyxyccXxG9bKxwhUS2CeGlgSm+c4WOQD4Ug2r8PpRfLTiiP/uL
	 wNBc3Z1r+IQJIXiqyQh5qR4rVsxL/S7lsjC9e1AHIHdy23zhKggxe4DF4nwELoiTksub/
	 w70eJkBE4M/nDscq5c1u601zqfaGwxjwT7BYxl1KoL4YRTAFnRQtesePu5H0q6VO6bG7M
	 A1SIBSHkTmmWtGHwm1J4uiCbXjOovtTt6Uui7UUTUp3XIpEP5RXEgvXTVLsKV7Qx4Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iU5O51DC;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECF606D827
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Nov 2026 11:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BECF606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iU5O51DC
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF2E9630DB;
	Mon,  9 Nov 2026 11:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EA41F0089F;
	Mon,  9 Nov 2026 11:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794223656;
	bh=GTe3rVqqBFubJwfvXPNDDRZX+sidHXepwnZzWomDy5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iU5O51DC6zVVQKzDHuys9tIxjfbSOhYw8z0UcE86pb//wkXavh32S2N8S2PUurU2A
	 o1E3RopKG7W94xtmWo25LA834OkIsoplK5Zc5sWRxNqoMBKXFQxzncUeAVAHVqzYUN
	 x0xzl99BebTVjgItzYyFM18S+rvSgi3xMyTZJ/jJZ69X0Gf56Vq2vszIAP9EEsAUq5
	 YP1A5SHoyPmQVAQUq/DaV61yYmuj4yVaaeC+HIcZMJhadQiWUxN4AW86j7fp4xdZK/
	 SKtdAofdOgM6AVAC0cEZ3+8Z/6By8LpM/kvwzBv9E4RtCHAt3TdDxZIlKuxADBPb0I
	 863RWmyUQ6DWA==
Date: Mon, 9 Nov 2026 12:27:22 +0100
From: Christian Brauner <brauner@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
	Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Eric Dumazet <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
	Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados <joel.granados@kernel.org>, 
	Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
	ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	ibm-acpi-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, 
	sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, 
	Chuck Lever <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 07/23] proc: let procfs own the seq_file of
 seq_file entries
Message-ID: <20261109-atemberaubend-begabung-bedienen-85aade0f99b4@brauner>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-7-76ace653a773@kernel.org>
 <8A21EE2A-F392-40B7-9152-CBC440FDDA70@kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8A21EE2A-F392-40B7-9152-CBC440FDDA70@kernel.org>

On Sat, Nov 07, 2026 at 08:10:28AM -0800, Kees Cook wrote:
> Please use the new style typed allocation calls for objects:
> 
> ops = kmalloc_obj(*ops);
> 
> (This happened to jump out at me, but please check the other patches for this pattern.)

Done, there are 5 of them in total:

proc: resume readdir after the last name it returned
-		cursor = kmalloc(sizeof(*cursor), GFP_KERNEL_ACCOUNT);
+		cursor = kmalloc_obj(*cursor, GFP_KERNEL_ACCOUNT);

proc: sysctl: resume readdir after the last name it returned
-		cursor = kmalloc(sizeof(*cursor), GFP_KERNEL_ACCOUNT);
+		cursor = kmalloc_obj(*cursor, GFP_KERNEL_ACCOUNT);

proc: keep the open files of an entry in an open node
-		dp->open = kzalloc(sizeof(*dp->open), GFP_KERNEL);
+		dp->open = kzalloc_obj(*dp->open);

proc: own the wait queue of an entry with a ->proc_poll()
-	on = kzalloc(sizeof(*on), GFP_KERNEL);
+	on = kzalloc_obj(*on);

proc: let procfs own the seq_file of seq_file entries
-	ops = kmalloc(sizeof(*ops), GFP_KERNEL);
+	ops = kmalloc_obj(*ops);

-- 
