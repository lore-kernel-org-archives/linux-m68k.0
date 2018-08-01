From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: strip is running out of memory on m68k (Haskell)
Date: Wed, 1 Aug 2018 11:02:50 +0200
Message-ID: <73bbb43e-731b-5c83-f339-4db276df6901@physik.fu-berlin.de>
References: <26510258-0207-9e43-0815-f6a56b8f38c3@physik.fu-berlin.de>
 <01f02625-3fef-c56f-357a-3e78ba4a4543@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <01f02625-3fef-c56f-357a-3e78ba4a4543@physik.fu-berlin.de>
Content-Language: en-US
Resent-Message-ID: <Ku3ohRq2OCJ.A.9b.NdXYbB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/73bbb43e-731b-5c83-f339-4db276df6901@physik.fu-berlin.de
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On 08/01/2018 10:37 AM, John Paul Adrian Glaubitz wrote:
> With binutils_2.31.1-1:
> 
>> https://buildd.debian.org/status/fetch.php?pkg=wireshark&arch=m68k&ver=2.6.2-1&stamp=1532706397&raw=0
> 
> With binutils_2.31.1-2:
> 
>> https://buildd.debian.org/status/fetch.php?pkg=wireshark&arch=m68k&ver=2.6.2-2&stamp=1533058050&raw=0
> 
> Will write a bug report upstream once I can confirm this.

Ok, downgrading to 2.31.1-1 definitely helps:

(sid-m68k-sbuild)root@epyc:/build/haskell-yaml-bukQp5/haskell-yaml-0.8.31.1/debian# strip tmp-inst-ghc/usr/bin/yaml2json
/usr/bin/strip:tmp-inst-ghc/usr/bin/yaml2json: memory exhausted
(sid-m68k-sbuild)root@epyc:/build/haskell-yaml-bukQp5/haskell-yaml-0.8.31.1/debian# strip tmp-inst-ghc/usr/bin/yaml2json
(sid-m68k-sbuild)root@epyc:/build/haskell-yaml-bukQp5/haskell-yaml-0.8.31.1/debian#

Adrian
