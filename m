Received: from vigilia.groessler.org (vigilia.groessler.org [79.143.177.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC353365
	for <linux-m68k@vger.kernel.org>; Thu, 12 Jun 2025 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.143.177.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734482; cv=none; b=B6mCEkzb0E0cXwDF81VRiYLyAhVi2Zv7cuQs/4NEPEkxedAm3EKCuDu3Ti9UzjcPooOelkz6blGrba0b6J1b2tJA36tvDvTjIO528VprokhLI7FbVeL5EdLahGbKXlpSBNQBtp+qhcTY72hb/aLV5WT3B5ai0CCsxIJ8OspxPXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734482; c=relaxed/simple;
	bh=jxlmUbdi/AgMcSuOhkAHebYOoNtEMHAlaMFAjfaCbbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZW2/AdKtTDNSdeEYnT9Wd5SJTt0fWMvMEMC0HjpPwyfumAiH9a50KtVM2s4A6mR0w9as/4GA64gaSpVBUN+pSZUH90oFPtIQjDyaJFU9IA4VkXSjoqe7lOlRwnsNfeBCJzK7oQ0NhxYflp1vnZLpPRlzPvqUoesc0iCSrq+Virs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groessler.org; spf=none smtp.mailfrom=groessler.org; arc=none smtp.client-ip=79.143.177.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groessler.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=groessler.org
Received: from [10.23.1.23] (gaga.groessler.org [212.168.189.235])
	by vigilia.groessler.org (8.16.0.45/8.14.6) with ESMTPS id 55CD633T098932
	(version=TLSv1.3 cipher=AEAD-AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 12 Jun 2025 15:06:03 +0200 (CEST)
Message-ID: <d1ead4c3-f814-46a3-98a5-ce1190f61566@groessler.org>
Date: Thu, 12 Jun 2025 15:06:03 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: =?UTF-8?B?QWRtaW5pc3RyYXRvciBAIFLCt1bCt0U=?= <admin@r-v-e.co>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "stefan.k.reinauer@gmail.com" <stefan.k.reinauer@gmail.com>,
        "fthain@linux-m68k.org" <fthain@linux-m68k.org>,
        "userm57@yahoo.com" <userm57@yahoo.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "jeanmichel.hautbois@yoseli.org" <jeanmichel.hautbois@yoseli.org>,
        "port-m68k@netbsd.org" <port-m68k@netbsd.org>,
        "debian-68k@lists.debian.org" <debian-68k@lists.debian.org>,
        "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
Content-Language: en-US
From: Christian Groessler <chris@groessler.org>
In-Reply-To: <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/12/25 10:25 AM, Administrator @ R·V·E wrote:
> Thanks for your great hard work and efforts to mantain the various and now considered exotic architectures running Debian, Adrian!

Seconded
