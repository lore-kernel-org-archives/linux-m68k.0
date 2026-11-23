Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.102.40.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393664;
	b=U6xSomSWbwdrp7lke0TT2dmyQV1hfFo+UhZOkGK0c56GVmkv2DhtO3rRLZXfJ/6JskUx
	 gb/B9aUKQkKloveovTUrD7u56eDDQ4hylwPWXumdnI5sRIw5AP3nsg3cHQRYcR2HMagxA
	 EY+OY4hsdw9ucCXU3Zs0Uc9DHicSFJ6IwB/WfCQOJF99nbk7YFvpL5Y62sEaWZT5iFOQ6
	 wHawGSnFVxLSoKXwg+y+N3h3c1SaLxkEkaxOcoW6px9n3FDTnCyoH4VLBd1IJt5jKFLmF
	 KQYDOUI9qz9U9bb1vmSEehIArlLv7P6FhNIkzg7Gus5BthOj4xJPa8luAp7cWfDq0qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393664;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Iq5fUxLG9GBLCX/+Ot+vNwP2avP4r9oPGg9LSg2QXyk=;
	b=Op/TSlGs22YNEpnYbcbnzTys1CAS5y4wjQ86BZtDU2z7czaj5/ozV4+VgfDZMYqUDIRX
	 TeOAjthFRMEZK1xAjxjKwqR30fyVplWu+tBygquJ8caSGVlRzFei1EK5uppp7g3RIPPtZ
	 LDHmZdDOJA4HPNAxOcQyblXTVK6+lBa5Bb3sRoMuooBBrabwtLbjcFjb4t3+zAr2Fo8mf
	 5HopiTioPWoigwK2CG42lb9mmFVJdhN0oaV6FDYRNxauSEIgCClZtqHV/3qDQWpx0tZa2
	 N7UrtscZdis2dZB7/sb+h6fviaIKKfXNT2oNfXKw9Oftc0dF/T82PLY2eUdirnahjJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=helsinkinet.fi;
	spf=pass smtp.mailfrom=helsinkinet.fi;
	dkim=pass header.d=helsinkinet.fi header.i=@helsinkinet.fi header.a=rsa-sha256 header.s=2025-03 header.b=dXfWcOj0;
	arc=none smtp.remote-ip=83.102.40.157
Received: from smtp.dnamail.fi (sender103.dnamail.fi [83.102.40.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9355C606A31A
	for <linux-m68k@vger.kernel.org>; Mon, 23 Nov 2026 00:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9355C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.a=rsa-sha256 header.s=2025-03 header.b=dXfWcOj0
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id 509D440978D0
	for <linux-m68k@vger.kernel.org>; Mon, 23 Nov 2026 02:27:33 +0200 (EET)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.157])
 by localhost (dmail-psmtp02.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 8a9x1a_vLnrR for <linux-m68k@vger.kernel.org>;
 Mon, 23 Nov 2026 02:27:32 +0200 (EET)
Received: from [192.168.101.100] (62-241-225-144.bb.dnainternet.fi [62.241.225.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id 9BF6240979D6
	for <linux-m68k@vger.kernel.org>; Mon, 23 Nov 2026 02:27:32 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 9BF6240979D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1795393652;
	bh=Iq5fUxLG9GBLCX/+Ot+vNwP2avP4r9oPGg9LSg2QXyk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=dXfWcOj0BuE2wtWoG3VGy3u6LQD8CULKUzKdPuZ/2gzwPb42EmoGRRVDx+16/gIRo
	 xukB4cp1ZdqAP8hGejFSTgQC4zCK/0Cv+Xp0FRJy+pReHUbRq+LeFrFBFXqKG2gS5A
	 baml9d+CVxaAx3TRQyuhG5oUnC6ghlx0vo9VmYiCt/4GISmNFbDIvAQEt3bxz4WK3n
	 aDIUcGZkI2rheQgcA+lLisSkprK5ExT5jv/+B0oc/W55Ebx3Uf6G9HLFq5cPntrIwg
	 xGEppK6UUhES/F5U8UWnCVFIjVj1Xm/kkN8B8hjys2NVKtXkpU3vhBq4BX6HY39oHm
	 0mmPDwa0uC88A==
Message-ID: <c18af5cd-ba3b-4c22-828b-83f36c2fc312@helsinkinet.fi>
Date: Mon, 23 Nov 2026 02:27:32 +0200
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Preserve fixups during dead code elimination
To: linux-m68k@vger.kernel.org
References: <20261113-fix_deadcode_elimination_for_tt_ram-v1-1-a6aa8e7cb90c@gmx.net>
 <CAFr9PXnjcZBac7jmdySkZNd0p4a5MCNnAFGOqOgDM1_wW+b9fQ@mail.gmail.com>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <CAFr9PXnjcZBac7jmdySkZNd0p4a5MCNnAFGOqOgDM1_wW+b9fQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/16/26 1:27 AM, Daniel Palmer wrote:
> Hi Christian,
> 
> On Sat, 14 Nov 2026 at 18:16, Christian Zietz via B4 Relay
> <devnull+czietz.gmx.net@kernel.org> wrote:
>> Fixes: 4fbdd56edf1f ("m68k: Enable dead code elimination")
> 
> That's mine. I wonder if this explains why one of my m68k machines
> would not boot with dead code elimination enabled. I forget which it
> was now :)
> Your change looks correct to me.
> 
> Acked-by: Daniel Palmer <daniel@thingy.jp>

Verified in latest Hatari (Git) emulator, using Linux kernel mapped to 
TT-RAM.

If dead code elimination is enabled, without the patch boot fails, but 
with it, it works (like it does without the patch when kernel is mapped 
to ST-RAM).

Enabling dead code elimination saves ~1/2 MB from ~5 MB m68k kernel 
size, which is ~10% size saving.


Geert, Christian already tested this on real HW.  Does this still need 
some additional testing?  (Sun? No-MMU?)


	- Eero

