Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE1821C167
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Oct 2025 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928766; cv=none; b=Wqi71TuW8ZG3MaGzyL//7OMNasa8UuHWFKilKs9pmjEZoRq5vosSjv5sg2TVUp2ZKNDkVGz491NZ2HfPQ4oWzYS8bBP1Sfan5c61foap6Evvf7gOhKFaoyxJnxhm8AK6x/MOQQZrsVDSdOt58nPHRf0DzHjhJBtFc3T9pE91faQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928766; c=relaxed/simple;
	bh=bDBSmVBWpfbY7PAaZEpHubLf7uYeTwh3B4k6cq15LUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGElbyk6Ngm4XqWxOeUD0u+nRvUNKxAfLvnYODM1cTWmXNUsGAViwRf1PM2qlHml4UPDqVjCWlA6KL0tu4XGX3Yz+VIaDJkR0KAMEHbZo3A+Pnt58GHHctpdkf/ah5JPC5whNsz3G4VrlHdJGfFxN6GSOkESTfocWrIwttYYyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=BQqPu1u4; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="BQqPu1u4"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id 387E22113E0A;
	Wed,  8 Oct 2025 15:56:24 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id GDv7ZgzeFdQs; Wed,  8 Oct 2025 15:56:23 +0300 (EEST)
Received: from [192.168.101.100] (87-92-77-37.bb.dnainternet.fi [87.92.77.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id C32C62113FD1;
	Wed,  8 Oct 2025 15:56:20 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi C32C62113FD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1759928183;
	bh=OCj4WpQavSfPv91/WhnHhKdc5F/dvQGVXuCoN9OhquQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BQqPu1u4Gnwm7jNBwS6NTOLQjgETu9AVmi5nHDxfI0dT/1ZRe83rb2GFU2WAUcnK3
	 oFcqed3tvdPWTDbLxqzwbcdTuCHH4jU2Zp7gzB2NiWOPnynpnWbJpUsNLsX38Fycbl
	 OVoyJzG8lSDG6gocx12s+WcWk1QNRdMAj7ozKhWDWNj8qZB9C+Qza7V6v5VcWZQf7A
	 /C91tytd4rio59SwMzMZzIs1RxWfUYdLd7dcrSwb4wWu27SSfy8qju6UFs278V6hfS
	 Eo3Z3W+QirXeKTxcciVE7dDfaS0eh3h/0DAq5zzMXrQd5/8lg6QsU21X3nPovzJwUY
	 8HYJOl/PfdZTg==
Message-ID: <8864b0ad-d9c7-4de3-b7e7-95512778822d@helsinkinet.fi>
Date: Wed, 8 Oct 2025 15:56:20 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] hung_task: fix warnings caused by unaligned lock
 pointers
To: Finn Thain <fthain@linux-m68k.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Lance Yang <lance.yang@linux.dev>, amaindex@outlook.com,
 anna.schumaker@oracle.com, boqun.feng@gmail.com, ioworker0@gmail.com,
 joel.granados@kernel.org, jstultz@google.com, leonylgao@tencent.com,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 longman@redhat.com, mhiramat@kernel.org, mingo@redhat.com,
 mingzhe.yang@ly.com, peterz@infradead.org, rostedt@goodmis.org,
 senozhatsky@chromium.org, tfiga@chromium.org, will@kernel.org,
 stable@vger.kernel.org
References: <20250909145243.17119-1-lance.yang@linux.dev>
 <yqjkjxg25gh4bdtftsdngj5suturft2b4hjbfxwe6hehbg4ctq@6i55py3jaiov>
 <99410857-0e72-23e4-c60f-dea96427b85a@linux-m68k.org>
 <CAMuHMdVYiSLOk-zVopXV8i7OZdO7PAK7stZSJNJDMw=ZEqtktA@mail.gmail.com>
 <inscijwnnydibdwwrkggvgxjtimajr5haixff77dbd7cxvvwc7@2t7l7oegsxcp>
 <20251007135600.6fc4a031c60b1384dffaead1@linux-foundation.org>
 <b43ce4a0-c2b5-53f2-e374-ea195227182d@linux-m68k.org>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <b43ce4a0-c2b5-53f2-e374-ea195227182d@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/8/25 03:40, Finn Thain wrote:
> On Tue, 7 Oct 2025, Andrew Morton wrote:
>> Getting back to the $Subject at hand, are people OK with proceeding
>> with Lance's original fix?
> 
> Lance's patch is probably more appropriate for -stable than the patch I
> proposed -- assuming a fix is needed for -stable.
> 
> Besides those two alternatives, there is also a workaround:
> $ ./scripts/config -d DETECT_HUNG_TASK_BLOCKER
> which may be acceptable to the interested parties (i.e. m68k users).
> 
> I don't have a preference. I'll leave it up to the bug reporters (Eero and
> Geert).

It's good for me.


	- Eero

