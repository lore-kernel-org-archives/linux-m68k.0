Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5712BF32
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jul 2024 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720599957; cv=none; b=oyqgqlja0lF6dTKNyHYb4TmVsdTBzNaW5yiNB4Imgaj1dXWn0yqce81Sm3uzAy32UrWiF9nrowCbl6LG6BPLg936S8gM/7z/a10bKkgLS17MhsiQBWoBjhrWjCheoGn27V2sqkHIVxS8YBkyaBir/HcL9DLUR1pedAxGrQubhYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720599957; c=relaxed/simple;
	bh=Z3mO8rLwuZrQJOOLROTQvSJNPjs5Sg8o/MPbpyKSSCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiVyXzsGo8enWKgVc8CS8eKJbVKY7l0Bl7SDXdSb5ITAst9mMl3puV+gK6eotgFcbb3H2NGRWIVRLu+QvAfGsmJvE8hspiuqhB+KhVp10ltomauWy3C2HLzgN5kTBh2juDyBWPknIOwiMXybr9rQ6ZXjOBPYlEpMciowu5hl24g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PT2ux4we; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PT2ux4we"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 47BC6CE14E8;
	Wed, 10 Jul 2024 08:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3010CC32781;
	Wed, 10 Jul 2024 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720599950;
	bh=Z3mO8rLwuZrQJOOLROTQvSJNPjs5Sg8o/MPbpyKSSCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PT2ux4weFBhoXqJ4nMNBt4uro2i99RcWh9/LrBYetb6DXIYjSh3LfgoXEiWS9N4n6
	 eWX3ig4OAWGO9Q7eVNTngeKhSYCHA3lOffm96K4NttxlJGssAE62TPv2XRH3748Sgd
	 cN8zJhePprIIf2NY7a05U7+Tb0WegmlJJSnD0FsA=
Date: Wed, 10 Jul 2024 10:25:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] zorro: make match function take a const pointer
Message-ID: <2024071038-antihero-fool-9438@gregkh>
References: <20240710073413.495541-2-gregkh@linuxfoundation.org>
 <CAMuHMdW2Y57bXMHjeGt+-vVQs-12DsoeXNYQ80NL+obbCrQiZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW2Y57bXMHjeGt+-vVQs-12DsoeXNYQ80NL+obbCrQiZw@mail.gmail.com>

On Wed, Jul 10, 2024 at 09:51:30AM +0200, Geert Uytterhoeven wrote:
> On Wed, Jul 10, 2024 at 9:34 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > In commit d69d80484598 ("driver core: have match() callback in struct bus_type
> > take a const *"), the match callback for busses was changed to take a const
> > pointer to struct device_driver.  Unfortunatly I missed fixing up the zorro
> 
> Unfortunately

Thanks for the review!

