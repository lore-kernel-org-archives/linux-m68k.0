Received: from smtp.dnamail.fi (sender103.dnamail.fi [83.102.40.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF8E19CD1D
	for <linux-m68k@vger.kernel.org>; Wed, 21 May 2025 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836569; cv=none; b=MZUgH7gFaerRZakTUdzl+rtB0uO4vh7J4wojBCIEU/o8bzpuoKGPqJK8gpB4sXyUTxqvgh9gjFJuiBH/PFXQHM4MngWkRySz+Xi4yObWvyqh4Ye1Ql97JymCxtQOGqDTuA9P5CiB+8UWSt8NDHXH5LkY7GbCAVI/sUESBTJrCQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836569; c=relaxed/simple;
	bh=CT8S+Vr36mNyhH53g3WQfHZmn2pQbP3+VlB16twbM6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBtQ0Db/1zM3yUzSyIgvtmuKYOmv8IBbgSoWL1W7Xllpi34LOhV+g52HU1NxIzNDzjaY8tnF0WSjucSS6ZdBDX9IvG/mTecNXcGp1rhyVVHVoHxKOqomW+egQqzSXOV/sIeLN3G5NVvB2lFuIBywmEVBR8n5Qnz7V4+SBMb96M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=WPfyJCA3; arc=none smtp.client-ip=83.102.40.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="WPfyJCA3"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id 5EB774098E83;
	Wed, 21 May 2025 17:09:21 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.157])
 by localhost (dmail-psmtp02.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id RkPkWoNvT_OY; Wed, 21 May 2025 17:09:20 +0300 (EEST)
Received: from [192.168.101.100] (78-27-104-28.bb.dnainternet.fi [78.27.104.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id B7AD94098E80;
	Wed, 21 May 2025 17:09:20 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi B7AD94098E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1747836560;
	bh=RsMvopIBCfuO6SK+9GeVjlTMxfxpD1jov7+UjpZTYR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WPfyJCA3SaSgs0lZW6dhO3jyLGVh9dZu4VENAsUPB19wC27VNYLjgXVsAF62qV6MX
	 rtjcYAm/p8SJOlaYSht0W8MX8yf/6bGTDGYTfrhQngcot1Qod0gZyCH0iaXNiD9FXN
	 cL2H6lhg7eFdbWvsQ9UUlE3rFzMa3pB32VrGCibWA1fzqzXvU+fvn+/3NGjqOrErRf
	 5Cp66ojrOIf0jFpfILe/7IqJD3MJ765Sltr+NVkOtm2XisP1OE2BBQBTyTbTcBe//3
	 lhkBg/pjDIiNxlchbsIiDntIU2eUofTqGtoyQt7b22znBqQZ1eJhjXYnDadvUECtJW
	 XcueaqLv7rSjg==
Message-ID: <0c84a202-2a7c-43c0-8d47-e73c0d9dc9ad@helsinkinet.fi>
Date: Wed, 21 May 2025 17:09:20 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Debian subset suitable for m68k (was: Tuple and changes for m68k
 with -malign-int)
To: John Klos <john@klos.com>
Cc: debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
 <8734d1kofn.fsf@oldenburg.str.redhat.com>
 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
 <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org>
 <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi John,

On 21.5.2025 4.59, John Klos wrote:
>> As I pointed out years ago, you need to stop wasting effort on packages
>> that aren't relevant anymore, due to bloat.
> 
> There's no real point being made here. Which packages aren't relevant 
> any more, due to bloat? Who decides?

Decision part is IMHO rather obvious, it should be both users and 
maintainers together.

It's good for maintainers to ask users for feedback on what matters on 
them, so that effort is not wasted on something that nobody uses.  And 
also to ask help if some task is larger, to see whether there's enough 
interest (= help available) to make that effort actually worthwhile. If 
not, what's the point of maintaining something nobody cares (enough)?

So next question is what are the best ways to reach users and get their 
feedback?

Package statistics, bug reports and just asking on the mailing list(s) 
are first things that come to my mind, but others may have other 
suggestions.

So to start, here are the things that are, and are not, relevant for me 
_on m68k_.  I.e. _personal_ opinions. First some general principles, and 
then few examples.


Relevant
--------

Base system, compilers, interpreters, misc tools, some graphics, and 
things shared between niche/retro communities (like m68k) in general.

In my case, for example:
- Kernel
- Busybox
- Gcc
- G++
- Lua
- Python
- La/TeX
- SDL1
- ScummVM
- Wired networking
- w3m, links, lynx etc
- Small niche windowing systems
- Slimmed-down Debian essentials


Not relevant
------------

Modern corporate backed software, and anything needing encryption or 
GPUs supporting GLES2+, I get enough of those on x86 Linux. They are too 
slow / large for m68k platform, and frankly boring, all something I try 
to avoid in my hobbies. :-)

For example:
- Java & C#
- LibreOffice
- Chrome/ium, Firefox, Webkit
- Modern desktop environments (KDE, Gnome...)
- libSDL v2 & v3, and things depending on them
- Wireless & VPN support
- Virtualization


Potentially relevant
--------------------

Some of the new tech, especially when it relates to smaller setups and 
base system, and more lightweight GUI apps, might also be of interest at 
some point:
- Wayland / Weston
- Golang
- Rust, Zig
- Abiword, Gnumeric, Evince (non-Gnome versions)
- LyX (LaTeX GUI)


Any thoughts on the above principles?


	- Eero

